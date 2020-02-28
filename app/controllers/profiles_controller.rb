class ProfilesController < ApplicationController
  before_action :set_user

  def show
    @user = current_user
    authorize @user

    @soundcloud_artist_ids = []
    @track_ids = []

    @user.parties.each do |party|
      party.artists.each do |artist|
        @soundcloud_artist_ids << SoundCloud.new(name: artist.name)
      end
    end

    @soundcloud_artist_ids.each do |soundcloud_artist_id|
      unless soundcloud_artist_id.nil?
        @track_ids << soundcloud_artist_id.sound_id
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
