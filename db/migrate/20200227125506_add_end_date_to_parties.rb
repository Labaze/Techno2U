class AddEndDateToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :end_date, :date
  end
end
