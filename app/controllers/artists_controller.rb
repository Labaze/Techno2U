require_relative '../services/soundcloud'

class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_artist, only: %i[show]

  def index
    @artists = policy_scope(Artist)
  end

  def show
    authorize @artist
    @user = current_user
    @soundcloud = Soundcloud.new(name: @artist.name)
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
