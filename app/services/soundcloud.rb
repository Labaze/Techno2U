require 'nokogiri'
require 'open-uri'

class SoundCloud

  def initialize(attrs = {})
    @name = attrs[:name]
  end

  def sounds_ids
    ids = find_sound_ids
  end

  def sound_id
    id = find_sound_id
  end

  private

  def soundcloud_artist_name
    url = "https://soundcloud.com/search?q=#{@name}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    slash_artist = html_doc.search('h2 a').first.attribute('href').value
  end

  # 5 track ID per artist
  def url_tracks_artist
    sound_urls = []
    end_url = soundcloud_artist_name
    base_url = "https://soundcloud.com"
    url_track = base_url + end_url + "/tracks"
    html_file = open(url_track).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('h2 a').first(10).each_with_index do |element, index|
      sound_urls << element.attribute('href').value  if index.even?
    end
    sound_urls
  end

  # 5 track ID per artist
  def find_sound_ids
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

  # 1 track ID per artist
  def url_track_artist
    sound_url = ""
    end_url = soundcloud_artist_name
    base_url = "https://soundcloud.com"
    url_track = base_url + end_url + "/tracks"
    html_file = open(url_track).read
    html_doc = Nokogiri::HTML(html_file)
    unless html_doc.search('h2 a').attribute('href').nil?
      sound_url = html_doc.search('h2 a').attribute('href').value
    end
    sound_url
  end

  # 1 track ID per artist
  def find_sound_id
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


