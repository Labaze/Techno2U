class ScrappingSoundcloudJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Artist.all.each do |artist|
      if artist.track_url.nil?
        artist.track_url = Soundcloud.scrapping_tracks(artist.name)
        artist.save
      end
    end
  end
end
