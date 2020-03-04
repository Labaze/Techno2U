class AttendingsController < ApplicationController

  def new
    @attending = Attending.new
    @party = Party.find(params[:party_id])
    authorize @party
    authorize @attending
  end

  def create
    @attending = Attending.new(party_id: params[:party_id])
    @party = Party.find(params[:party_id])
    @attending.party = @party
    @attending.user = current_user
    authorize @attending
    if @attending.save
        redirect_to root_path
    else
      redirect_to party_path(params[:attending_id]), :alert => "You are already going to this party, you fat fuck!"
    end
  end

  def destroy
    @attending = Attending.find(params[:id])
    @attending.destroy
    authorize @attending
    redirect_to request.referrer
  end


  private

  def attenting_params
    params.require(:attending).permit(:party_id, :user_id)
  end

end

