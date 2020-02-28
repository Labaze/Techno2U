require_relative '../services/soundcloud'

class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show]

  def index
    @artist = policy_scope(Artist)
  end

  def show
    authorize @artist
    @user = current_user
    authorize @user
    @artist = Artist.find(params[:id])
    @soundcloud = SoundCloud.new(name: @artist.name)
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
