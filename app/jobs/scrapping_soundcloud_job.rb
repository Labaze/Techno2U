class ScrappingSoundcloudJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Artist.all.each do |artist|
      artist.track_url = SoundCloud.scrapping_tracks(artist.name)
      artist.save
    end
  end
end
