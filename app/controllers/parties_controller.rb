require_relative '../services/soundcloud'

class PartiesController < ApplicationController
  before_action :set_party, only: %i[show edit update destroy]


  # READ

  def index
    @parties = policy_scope(Party).first(3)
    @user = current_user

    @soundcloud_artists = []
    @track_ids = []


    if params[:search][:location].present?
      @parties = Party.where("venue_location ILIKE ?", "%#{params[:search][:location]}%").first(3)
      @parties.each do |party|
        unless party.artists.first.nil?
          @soundcloud_artists << SoundCloud.new(name: party.artists.first.name)
        end
      end
    else
      @parties.each do |party|
        unless party.artists.first.nil?
          @soundcloud_artists << SoundCloud.new(name: party.artists.first.name)
        end
      end
    end


    @soundcloud_artists.each do |soundcloud_artist_id|
      unless soundcloud_artist_id.nil?
        @track_ids << soundcloud_artist_id.sound_id
      end
    end
  end

  def show
    @attending = Attending.new
    authorize @party
    @user = current_user

    @soundcloud_artists = []
    @track_ids = []

    parties = Party.geocoded #returns parties with coordinates
    @markers = [{
      lat: @party.latitude,
      lng: @party.longitude
    }]

    @party.artists.each do |artist|
      unless artist.nil?
        @soundcloud_artists << SoundCloud.new(name: artist.name)
      end
    end

    @soundcloud_artists.each do |soundcloud_artist_id|
      unless soundcloud_artist_id.nil?
        @track_ids << soundcloud_artist_id.sound_id
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

  def restaurant_params
    params.require(:party).permit(:name, :start_time, :end_time, :venue_type, :venue_location, :genre_id)
  end
end
