require_relative '../services/soundcloud'

class PreferencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @preference = Preference.new
    authorize @preference

    track_ids = []

    @user = current_user
    @artists = Artist.joins(:parties).where("start_date >= ?", Date.today).limit(10)

    @artists.each do |artist|
      track_ids << artist.track_url
    end
    @tracks = track_ids.reject { |c| c == "" }
  end
end
