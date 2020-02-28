require_relative '../services/soundcloud'

class PreferencesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def new
    @preference = Attending.new
    authorize @preference
    artists = Artist.all.sample(5)
    @user = current_user

    @soundcloud_artist_ids = []
    track_ids = []

    artists.each do |artist|
      @soundcloud_artist_ids << SoundCloud.new(name: artist.name)
    end

    @soundcloud_artist_ids.each do |soundcloud_artist_id|
      unless soundcloud_artist_id.nil?
        track_ids << soundcloud_artist_id.sound_id
      end
    end

    @tracks = track_ids.reject { |c| c == "" }
  end

  def create
  end
end
