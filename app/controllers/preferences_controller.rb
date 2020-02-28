require_relative '../services/soundcloud'


class PreferencesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def new
    @preference = Attending.new
    authorize @preference
    artists = Artist.all
    # artists = ['maceo plex', 'mall grab']
    @user = current_user

    @soundcloud_artist_ids = []
    @tracks = []

    artists.each do |artist|
      @soundcloud_artist_ids << SoundCloud.new(name: artist.name)
    end

    @soundcloud_artist_ids.each do |soundcloud_artist_id|
      unless soundcloud_artist_id.nil?
        @tracks << soundcloud_artist_id.sound_id
      end
    end
  end

  def create
  end
end
