class AddStartDateToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :start_date, :date
  end
end
