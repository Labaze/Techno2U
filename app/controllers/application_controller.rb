class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
 # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def transform_gender_to_numerical_variable(user_gender)
    user_gender == "M"? 1 : 0
  end

  def transform_usage_to_numerical_variable(user_usage)
    if user_usage == 'Find a party'
      1
    elsif user_usage == 'Discover new artists'
      2
    else
      3
    end
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
    knn_vectors  = []
    @user_ids    = []
    #we create all vectors related to user based on Gender, Age, Usage of the WebApp, Music Genres
    User.where.not(cluster: nil).each do |user|
      @user_ids        << user.id

      user_x_variables = []
      # gender
      user_x_variables << transform_gender_to_numerical_variable(user.gender)
      # age
      user_x_variables << user.age
      #usage
      user_x_variables << transform_usage_to_numerical_variable(user.use)

      #genre (matrix full of 0 and 1: 0 if not the genre, 1 otherwise)
      transform_genres_to_numerical_variables(user.genres.sort).each do |element|
        user_x_variables << element
      end
      #user_type
      user_y_variable = user.cluster
      knn_vectors << Knn::Vector.new(user_x_variables, user_y_variable)
    end
    knn_vectors
  end


  def predict_user_category(dataset, user, k)
    classifier = Knn::Classifier.new(dataset, k)
    user_x_variables    = []
    user_x_variables    << transform_gender_to_numerical_variable(user.gender)
    user_x_variables    << user.age
    user_x_variables    << transform_usage_to_numerical_variable(user.use)
    transform_genres_to_numerical_variables(user.genres).each do |element|
      user_x_variables << element
    end
    new_entry_to_classify = Knn::Vector.new(user_x_variables, nil)
    user.cluster = classifier.classify(new_entry_to_classify)
    user.save
  end


  def find_user_neighbours(dataset, user, k)
    classifier = Knn::Classifier.new(dataset, k)
    user_x_variables    = []
    user_x_variables    << transform_gender_to_numerical_variable(user.gender)
    user_x_variables    << user.age
    user_x_variables    << transform_usage_to_numerical_variable(user.use)
    transform_genres_to_numerical_variables(user.genres).each do |element|
      user_x_variables << element
    end
    new_entry_to_classify = Knn::Vector.new(user_x_variables, nil)
    nearest_neighbours_numeric = classifier.nearest_neighbours_to(new_entry_to_classify)
    nearest_neighbours_ids = nearest_neighbours_numeric.map { |neighbour| @user_ids[@dataset.find_index(neighbour)]}
  end




  # Adding Attribute name to User, allow add and update
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender, :use, :admin] )
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :admin] )
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
