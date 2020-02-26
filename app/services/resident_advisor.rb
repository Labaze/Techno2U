require 'nokogiri'
require 'open-uri'
require 'CSV'

class ResidentAdvisor

  def self.scrapping_artists_top_1000
    artists = []

    url = 'https://www.residentadvisor.net/dj.aspx'
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('a').each do |artist|
      artists << artist.text.strip
    end

    start_list = artists.index("0-9")
    end_list = artists.index("RA")
    artists[start_list..end_list].map! do |element|
      artists.delete(element) if element == ""
    end
    artists.slice(start_list, 1022).each{ |artist| Artist.create(name: artist) }
  end

  def self.scrapping_parties(city, period, date)
    # date format yyyy-mm-dd, period = day / week / month
    url = "https://www.residentadvisor.net/events/de/#{city.downcase}/#{period.downcase}/#{date}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.event-title').each do |element|
      party_name = element.children.first.text
      party_location = element.children.last.search('a').text
      party_url = "https://www.residentadvisor.net" + element.children.first.attribute('href').value
      # Party.create(name: party_name, venue_location: party_location, url: party_url)
    end
  end

  def self.scrapping_date(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    p date_time = html_doc.search('#detail li').first.text
    if date_time.size > 40
      time = date_time.last(13)
      day_start = Date.parse(date_time.split(/\/(.*) - ([a-zA-Z]{3}.*)/)[1])
      time_start = time.first(5)
      day_end = Date.parse(date_time.split(/\/(.*) - ([a-zA-Z]{3}.*)/)[2][0...-13])
      time_end = time.last(5)
      result =  {start_day: day_start, end_day: day_end, start_time: time_start, end_time: time_end}
    else
      day_start = Date.parse(date_time.split(/(\d+ \w{3} \d{4})/)[1])
      time_start = date_time.split(/(\d+ \w{3} \d{4})/)[2].first(5)
      time_end = date_time.split(/(\d+ \w{3} \d{4})/)[2].last(5)
      time_start.to_f < 24 && time_end.to_f > 00 && time_start.to_f > time_end.to_f ? day_end = day_start + 1.days : day_end = day_start
      result =  {start_day: day_start, end_day: day_end, start_time: time_start, end_time: time_end}
    end
    result
  end

  def self.scrapping_address(url)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    address = html_doc.search('#detail .wide').children[3].text
  end

  private

  def create_time(arg)

  end
end
