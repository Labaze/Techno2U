require_relative '../services/soundcloud'

class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @user = current_user
    authorize @user

    @track_ids = []

    @user.parties.each do |party|
      party.artists.each do |artist|
        @track_ids << artist.track_url
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
