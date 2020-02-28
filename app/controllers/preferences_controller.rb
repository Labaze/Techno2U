class PreferencesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def new
    @preference = Attending.new
    authorize @preference

    artist = "mall grab"
    # @soundclouds = []
    # artists.each do |artist|
      # @soundclouds << SoundCloud.new(name: artist)
      @soundclouds = SoundCloud.new(name: artist)

    # end
  end

  def create
  end
end
