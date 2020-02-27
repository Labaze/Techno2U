require_relative '../services/soundcloud'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    artists = ["maceo plex", "fakear", "jamie jones"]
    @soundclouds = []
    artists.each do |artist|
      @soundclouds << SoundCloud.new(name: artist)
    end
  end
end
