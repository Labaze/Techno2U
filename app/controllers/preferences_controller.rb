require_relative '../services/soundcloud'

class PreferencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @preference = Preference.new
    authorize @preference

    @tracks = []

    @locations = ["Lille","Paris", "Berlin", "London", "Rome", "Amsterdam", "New York", "Tokyo"]
    @user = current_user

    @artists = Artist.joins(:parties).where('start_date >= ?', Date.today).where('track_url IS NOT NULL').where('venue_location ILIKE :query', query: "%#{params[:location]}%").limit(10)
    
    @artists.each do |artist|
      @tracks << artist.track_url
    end
  end
end
