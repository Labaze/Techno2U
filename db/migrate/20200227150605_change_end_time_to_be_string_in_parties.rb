class ChangeEndTimeToBeStringInParties < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :end_time, :string
  end
end
