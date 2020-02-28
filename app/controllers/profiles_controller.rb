class ProfilesController < ApplicationController
  before_action :set_user

  def show
    authorize @user
    @parties = policy_scope(Party)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
