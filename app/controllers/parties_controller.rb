require_relative '../services/soundcloud'

class PartiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_party, only: %i[show edit update destroy]


  def index
    @parties = policy_scope(Party).sample(4)
    @user = current_user

    if !params[:query].nil?
      artist_names = JSON.parse(params[:query])
      @parties = Party.joins(:artists).where("artists.name IN (?)", artist_names).uniq
      @parties = Party.where(id: @parties.map(&:id))
      @parties = @parties.page params[:page]
    elsif params[:search].nil? || params[:search][:location].empty? #params[:search].nil?
      location = "Paris"
      @parties = Party.where("end_date >= ?", Date.today).where("venue_location ILIKE :query", query: "%#{location}%")
      @parties = @parties.page params[:page]
    else
      @parties = Party.where("venue_location ILIKE :query", query: "%#{params[:search][:location]}%")
      date = Date.parse params[:search][:start_date] if params[:search][:start_date].present?
      @parties = @parties.where("start_date = ?", date) if params[:search][:start_date].present?
      @parties = @parties.page params[:page]
    end
  end

  def show
    @attending = Attending.new
    authorize @party
    @user = current_user

    parties = Party.geocoded #returns parties with coordinates
    @markers = [{
      lat: @party.latitude,
      lng: @party.longitude
    }]

    @track_ids = {}

    @party.artists.each do |artist|
      unless artist.nil?
        @track_ids[artist.name] = artist.track_url
      end
    end

  end

  # UPDATE

  def edit
    authorize @party
    @user = current_user
  end

  def update
    user_artist = params[:party][:artists]
    if Artist.find_by(name: user_artist).nil?
      artist = Artist.create(name: user_artist)
    else
      artist = Artist.find_by(name: user_artist)
    end
    @party.artists = artists
    @party.start_time = start_time
    @party.end_time = end_time
    @party.venue_location = venue_location
    @party.venue_type = venue_type
    @party.genre = genre
    authorize @party
    if @party.save
      redirect_to party_path(@party)
    else
      render :edit
    end
  end

  # DELETE

  def destroy
    authorize @vinyl
    @vinyl.destroy
    redirect_to request.referrer
  end

  private

  def set_party
    @party = Party.find(params[:id])
  end

  def party_params
    params.require(:party).permit(:name, :start_time, :end_time, :venue_type, :venue_location, :genre_id)
  end
end

