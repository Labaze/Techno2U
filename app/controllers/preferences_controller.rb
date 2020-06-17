require_relative '../services/soundcloud'

class PreferencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]

  def new
    @preference = Preference.new
    authorize @preference
    @tracks = []
    @locations = ["Lille","Paris", "Berlin", "London", "Rome", "Amsterdam", "New York", "Tokyo"]
    @user = current_user
    # @artists = Artist.joins(:parties).where('start_date >= ?', Date.today).where('track_url IS NOT NULL').where('venue_location ILIKE :query', query: "%#{params[:location]}%").limit(10).order(:start_date)
    @artists = Artist.joins(:parties).where.not(name: 'Unknown').where('start_date >= ?', Date.today).where('track_url IS NOT NULL').where('venue_location ILIKE :query', query: "%#{params[:location]}%").limit(10).order(:start_date)
    @artists.each do |artist|
      @tracks << artist.track_url
    end
  end




  def create
    prefered_genre_ids = params[:preference][:genre].reject {|a| a == ''}
    prefered_genre_ids

    prefered_genre_ids.each do |genre_id|
      @preference = Preference.new
      @preference.user = current_user
      @preference.genre = Genre.find(genre_id)
      authorize @preference
      @preference.save
    end
    raise
    redirect_to(root_path)
  end

  # SECURITY FOR PARAMS
  private
  def preferences_params
    params.require(:preference).permit(:genre)
  end
end
