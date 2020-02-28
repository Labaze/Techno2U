require 'nokogiri'
require 'date'
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
    artists.slice(start_list, 1022).each do |artist_name|
      if Artist.find_by(name: artist_name).nil?
        artist = Artist.create(name: artist_name)
      end
    end
  end

  def self.scrapping_parties(country, city, period, date)
    # country format in 2 letters
    # date format yyyy-mm-dd, period = day / week / month
    events_page = scrapper("https://www.residentadvisor.net/events/#{country.downcase}/#{city.downcase}/#{period.downcase}/#{date}")
    links = events_page.search('.event-title a')
    links.select{|link| link.attribute('href').value.include?("events/")}.each do |link|
      url = "https://www.residentadvisor.net#{link.attribute('href').value}"
      doc = scrapper(url)
      party = Party.new

      party.url            = url
      party.name           = scrapping_name(doc)
      party.start_date     = scrapping_date(doc)[:start_date]
      party.end_date       = scrapping_date(doc)[:end_date]
      party.start_time     = scrapping_date(doc)[:start_time]
      party.end_time       = scrapping_date(doc)[:end_time]
      party.venue_location = scrapping_venue_location(doc)
      party.venue_name     = scrapping_venue_name(doc)
      party.image_url      = scrapping_image_url(doc)
      party.description    = scrapping_description(doc)
      party.facebook_link  = scrapping_facebook_link(doc)

      party.save

      artists                 = scrapping_artists(doc)
      artists.each do |artist_name|
        if Artist.find_by(name: artist_name).nil?
          artist = Artist.create(name: artist_name)
        else
          artist = Artist.find_by(name: artist_name)
        end
        Lineup.create(artist: artist, party: party)
      end
    end
  end

  def self.scrapping_name(doc)
    doc.search('h1').first.text
  end

  def self.scrapping_date(doc)
    scrap = doc.search('#detail li')

    date_time = scrap.first.text

    if date_time.size > 40
      times = create_time(date_time)
      dates = create_date_2_days_party(date_time)
      {start_date: dates[0], end_date: dates[1], start_time: times[0], end_time: times[1]}
    else
      times = create_time(date_time)
      day = create_date_1_day_party(date_time)
      dates = end_day_1_day_party(day, times)
      {start_date: dates[0], end_date: dates[1], start_time: times[0], end_time: times[1]}
    end
  end

  def self.scrapping_venue_name(doc)
    doc.search('#detail .wide .cat-rev').children.text.strip
  end

  def self.scrapping_venue_location(doc)
    scrap = doc.search('#detail .wide')
    scrap.children[3].nil? ? "" : scrap.children[3].text.strip
  end

  def self.scrapping_artists(doc)
    artists = []
    scrap = doc.search('.lineup a')
    scrap.each{ |artist| artists << artist.text}
    artists
  end

  def self.scrapping_image_url(doc)
    scrap = doc.search('.flyer a')
    scrap.attribute('href').nil? ? "" : scrap.attribute('href').value
  end

  def self.scrapping_description(doc)
    doc.search('.lineup').children.first
  end

  def self.scrapping_facebook_link(doc)
    doc.search('.links a').last.attribute('href').value
  end

  private

  def self.scrapper(url)
    sleep(1)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
  end

  def self.create_time(date_time)
    time = date_time.last(13)
    [time.first(5), time.last(5)]
  end

  def self.create_date_2_days_party(date_time)
    dates = date_time.split(/\/(.*) - ([a-zA-Z]{3}.*)(.{13})/)
    [Date.parse(dates[1]), Date.parse(dates[2])]
  end

  def self.create_date_1_day_party(date_time)
    date = date_time.split(/(\d+.*)(.{13})/)[1]
  end

  def self.end_day_1_day_party(date, time)
    if time[0].to_f < 24 && time[1].to_f > 00 && time[0].to_f > time[1].to_f
      [Date.parse(date), Date.parse(date) + 1.days]
    else
      [Date.parse(date), Date.parse(date)]
    end
  end
end
