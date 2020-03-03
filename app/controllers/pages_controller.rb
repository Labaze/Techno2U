require_relative '../services/soundcloud'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @non_existing_session = session.id.nil?
  end
end
