    redirect_to request.referrer
class PartiesController < ApplicationController
  before_action :set_party, only: %i[show edit update destroy]


  # READ

  def index
    @parties = policy_scope(Party)
  end

  def show
    @attending = Attending.new
    authorize @party
  end

  # UPDATE

  def edit
    authorize @party
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
    params.require(:party).permit(:name, :begin, :end, :venue_type, :venue_location, :genre_id)
  end
end
