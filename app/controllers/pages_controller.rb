require_relative '../services/soundcloud'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @non_existing_session = session.id.nil?
    @genres = Genre.all.sort_by { |genre| genre.name}
    @user = current_user
    @preference = Preference.new
    @dataset = knn_dataset

    unless @user.nil? || @user.genres.empty? #Predict the class of the new User, we wait for user to insert musical preferences
      if @user.cluster.nil?
        predict_user_category(@dataset, @user, 15)
      end
    end
  end
end
