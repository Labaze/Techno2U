class PreferencesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def new
    @preference = Attending.new
    authorize @preference
    @user = current_user
  end

  def create
  end
end
