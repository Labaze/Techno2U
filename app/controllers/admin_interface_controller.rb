require 'Knn'

class AdminInterfaceController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @user    = current_user
    @kmax    = 20
    dataset  = knn_dataset
    @pcc_val = select_k_best_repeated_cross_validation(dataset, @kmax)  #To Compute all the PCCs for the validation set (for all K)
  end


  def transform_genres_to_numerical_variables(user_preferred_genres)
    genres = Genre.all.sort
    output = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    user_preferred_genres.each do |genre|
      output[genres.find_index(genre)] = 1
    end
    return output
  end


  def knn_dataset
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
      transform_genres_to_numerical_variables(user.genres.sort).each do |element|
        user_x_variables << element
      end
      #user_type
      user_y_variable = user.cluster
      vectors << Knn::Vector.new(user_x_variables, user_y_variable)
    end
  end

  def select_k_best_repeated_cross_validation(dataset, kmax)
    # Repeated Cross-validation
    n = dataset.length

    n_train = (0.7*n).to_i
    n_test  = n-n_train
    train_data_set = dataset.sample(n_train)
    test_data_set = (dataset - train_data_set)

    (1..kmax).map do |k|
      classifier = Knn::Classifier.new(train_data_set, k)
      counter = 0

      test_data_set.each do |test_data|
        Knn::Vector.new(test_data, nil)
        y_new = classifier.classify(test_data)
        counter =+ 1 if y_new == test_data.label
        pcc = counter/n_test.to_f
        @pcc_val << pcc
      end
        @pcc_val
        k_best = @pcc_val.rindex(@pcc_val.max)
        return k_best
    end
  end
end
