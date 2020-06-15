require 'Knn'

class AdminInterfaceController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @user = current_user
    @users = User.all
  end


  def transform_genres_to_numerical_variables(user_preferred_genres)
    genres = Genre.all.sort
    output = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    user_preferred_genres.each do |genre|
      output[genres.find_index(genre)] = 1
    end
    return output
  end


  def knn_algorithm(k)
    # https://github.com/JonMidhir/ruby-knn
    vectors = []
    #we create all vectors related to user based on Gender, Age, Usage of the WebApp, Music Genres
    User.all.each do |user|
      user_x_variables = []
      # gender
      user.gender == "M"? user_x_variables << 1 : user_x_variables << 0
      # age
      user_x_variables << user.age
      #usage
      if user.use == 'Find a party'
        user_x_variables << 1
      elsif user.use == 'Discover new artists'
        user_x_variables << 2
      else
        user_x_variables << 3
      end
      #genre (matrix full of 0 and 1: 0 if not the genre, 1 otherwise)
      transform_genres_to_numerical_variables(user.genres.sort).each do |element| # user_x_variables << user.genres #Voir s'il faut pas les mettres en noms each do name
        user_x_variables << element
      end
      #user_type
      # user_y_variable = user.type
      vectors << Knn::Vector.new(user_x_variables, 'TETS') #user_y_variable)
    end
      classifier = Knn::Classifier.new(vectors, k)
  end



  def knn_prediction(new_entry)
    # new_entry = Knn::Vector.new([2,2], nil)
    # classifier.classify(new_entry)
  end
end
