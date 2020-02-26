require 'nokogiri'
require 'open-uri'

class SoundCloud

  def initialize(attrs = {})
    @name = attrs[:name]
  end

  def sounds_ids
    ids = find_sound_id
  end

  private

  def scrapping_soundcloud
    url = "https://soundcloud.com/search?q=#{@name}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    slash_artist = html_doc.search('h2 a').first.attribute('href').value
  end


  def url_tracks_artist
    sound_urls = []
    end_url = scrapping_soundcloud
    base_url = "https://soundcloud.com"
    url_track = base_url + end_url + "/tracks"
    html_file = open(url_track).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('h2 a').first(4).each_with_index do |element, index|
      sound_urls << element.attribute('href').value  if index.even?
    end
    sound_urls
  end

  def find_sound_id
    id = ""
    ids = []
    base_url = "https://soundcloud.com"
    end_urls = url_tracks_artist
    end_urls.each do |url|
      sound_url = base_url + url
      html_file = open(sound_url).read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('meta').each do |element|
        content = element.attribute('content')
        id = content.value if !content.nil? && content.value.include?('sounds:')
      end
     ids << id.gsub("soundcloud://sounds:","")
    end
    ids
  end
end
