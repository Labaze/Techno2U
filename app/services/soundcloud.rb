require 'nokogiri'
require 'open-uri'
require 'CSV'

class SoundCloud
  def self.scrapping_soundcloud(artist)
    url = "https://soundcloud.com/search?q=fakear"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    p html_doc.search('.searchTitle__textContent')
  end
end
p SoundCloud.scrapping_soundcloud('fakear')
