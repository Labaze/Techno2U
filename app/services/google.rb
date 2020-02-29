require 'nokogiri'
require 'open-uri'
require 'csv'

class Google
  def self.scrapping_venue_type(venue_name)
    url = "https://www.google.com/search?q=#{venue_name.gsub(/\s/, '+')}"
    scrapper_google(url, 'h3').each{ |element| p element.content }
  end

  private

  def self.scrapper_google(url, tag)
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.css(tag)
  end
end
