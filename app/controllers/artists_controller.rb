class ArtistsController < ApplicationController
  before_action :set_artist, only: %i[show]

  def index
    @artist = policy_scope(Artist)
  end

  def show
    authorize @artist
  end

  private

  def set_party
    @artist = Artist.find(params[:id])
  end

end
