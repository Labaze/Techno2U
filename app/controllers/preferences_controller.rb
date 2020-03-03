require_relative '../services/soundcloud'

class PreferencesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def new
    @preference = Attending.new
    authorize @preference
    @artists = Artist.all.sample(5)
    @user = current_user
    track_ids = []


    @artists.each do |artist|
      track_ids << artist.track_url
    end
    @tracks = track_ids.reject { |c| c == "" }
  end

  def create
  end
end
