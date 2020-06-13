require_relative '../services/soundcloud'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @non_existing_session = session.id.nil?
    @genres = Genre.all.sort_by { |genre| genre.name}
    @user = current_user
    @preference = Preference.new
  end
end
