class AdminInterfaceController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @user    = current_user
    @kmax    = 15
    @dataset = knn_dataset
    @pcc_val = select_k_best_repeated_cross_validation(@dataset, @kmax)  #To Compute all the PCCs for the validation set (for all K)
  end

  def select_k_best_repeated_cross_validation(dataset, kmax)
    n                  = dataset.length
    all_pcc            = []
    n_train            = (0.7*n).to_i
    n_test             = n-n_train

    train_data_set     = dataset.sample(n_train)
    test_data_set      = (dataset - train_data_set)

    (1..kmax).map do |k|
      classifier       = Knn::Classifier.new(train_data_set, k)
      counter          = 0

      test_data_set.each do |test_data|
        y_actual_value = test_data.label
        y_new          = classifier.classify(test_data)
        counter        += 1 if y_new == y_actual_value
      end
        pcc            = (counter/n_test.to_f).round(2)
        all_pcc        << pcc
    end
    return all_pcc
  end
end
