class AttendingsController < ApplicationController

  def new
    @attending = Attending.new
    @party = Party.find(:party_id)
    authorize @party
    authorize @attending
  end

  def create
    @attending = Attending.new(attending_params)
    @party = Party.find(:party_id)
    @attending.party = @party
    @attending.user = current.user
    authorize @attending
    if @attending.save
      redirect_to party_path(@attending.party)
    else
      redirect_to party_path(params[:attending_id]), :alert => "You are already going to this party, you fat fuck!"
    end
  end

  def destroy
    @attending = Attending.find(params[:id])
    @attending.destroy
    authorize @attending
  end


  private

  def attenting_params
    params.require(:attending).permit(:party_id, :user_id)
  end

end

