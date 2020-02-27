class LineupsController < ApplicationController

  def new
    @lineup = Lineup.new
    @party = Party.find(params[:party_id])
    authorize @lineup
    authorize @party
  end

  def create
    @lineup = Lineup.new(lineup_params)
    @party = Party.find(params[:party_id])
    @artist = Artist.find(params[:artist_id])
    @lineup.party = @party
    @lineup.artist = @artist
    authorize @lineup
    if @lineup.save
      redirect_to party_path(@lineup.party)
    else
      redirect_to party_path(params[:attending_id]), :alert => "This artist is already playing at this party, you fat fuck!"
    end
  end

  def destroy
    @lineup = Lineup.find(params[:id])
    @lineup.destroy
    authorize @lineup
  end


  private

  def lineup_params
    params.require(:lineup).permit(:party_id, :artist_id)
  end
end
