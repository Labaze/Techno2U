require_relative '../services/soundcloud'

class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @user = current_user
    authorize @user

    track_ids = []

    @user.parties.each do |party|

      # party.artists.each do |artist|
        track_ids << party.artists.first.track_url
      # end
    end

    # @tracks = track_ids.reject { |c| c == "" }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
