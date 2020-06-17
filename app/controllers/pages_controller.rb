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
        classifier = Knn::Classifier.new(@dataset, 15)
        user_x_variables    = []
        user_x_variables    << transform_gender_to_numerical_variable(@user.gender)
        user_x_variables    << @user.age
        user_x_variables    << transform_usage_to_numerical_variable(@user.use)
        transform_genres_to_numerical_variables(@user.genres).each do |element|
          user_x_variables << element
        end
        new_entry_to_classify = Knn::Vector.new(user_x_variables, nil)
        @user.cluster = classifier.classify(new_entry_to_classify)
        nearest_neighbours_numeric = classifier.nearest_neighbours_to(new_entry_to_classify)
        nearest_neighbours_ids = nearest_neighbours_numeric.map { |neighbour| @user_ids[@dataset.find_index(neighbour)]}
      end
    end
  end
end
