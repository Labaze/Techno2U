require 'nokogiri'
require 'open-uri'
require 'csv'
require 'uri'

class SoundCloud

  def initialize(attrs = {})
    @name = attrs[:name]
  end

  def sounds_ids
    find_sound_ids
  end

  def sound_id
    find_sound_id
  end

  def self.scrapping_tracks(artist_name)
    sleep(2)
    soundcloud = Soundcloud.new(name: artist_name)
    soundcloud.sound_id
  end

  private

  def soundcloud_artist_name
    encoded_name = CGI.escape(@name)
    url = URI.parse("https://soundcloud.com/search?q=#{encoded_name}")

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('h2 a').first.attribute('href').value unless html_doc.search('h2 a').first.nil?
  end

  # 5 track ID per artist
  def url_tracks_artist
    unless soundcloud_artist_name.nil?
      sound_urls = []
      base_url = "https://soundcloud.com/"
      end_url = soundcloud_artist_name.split("/")[1]
      url_track = base_url + end_url + "/tracks"
      html_file = open(url_track).read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('h2 a').first(10).each_with_index do |element, index|
        sound_urls << element.attribute('href').value  if index.even?
      end
      sound_urls
    end
  end

  # 5 track ID per artist
  def find_sound_ids
    unless soundcloud_artist_name.nil?
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

  # 1 track ID per artist
  def url_track_artist
    unless soundcloud_artist_name.nil?
      sound_url = ""
      end_url = soundcloud_artist_name.split("/")[1]
      base_url = "https://soundcloud.com/"
      url_track = base_url + end_url + "/tracks"
      html_file = open(url_track).read
      html_doc = Nokogiri::HTML(html_file)
      unless html_doc.search('h2 a').attribute('href').nil?
        sound_url = html_doc.search('h2 a').attribute('href').value
      end
      sound_url
    end
  end

  # 1 track ID per artist
  def find_sound_id
    unless soundcloud_artist_name.nil?
      end_url = url_track_artist
      id = ""
      base_url = "https://soundcloud.com"
      sound_url = base_url + end_url
      html_file = open(sound_url).read
      html_doc = Nokogiri::HTML(html_file)
      html_doc.search('meta').each do |element|
        content = element.attribute('content')
        id = content.value if !content.nil? && content.value.include?('sounds:')
      end
      id.gsub("soundcloud://sounds:","")
    end
  end

end


