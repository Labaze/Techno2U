class ProfilesController < ApplicationController
  before_action :set_user

  def show
    authorize @user

    artists = ["maceo plex"]
    @soundclouds = []
    artists.each do |artist|
      @soundclouds << SoundCloud.new(name: artist)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
