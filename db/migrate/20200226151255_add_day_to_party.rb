class AddDayToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :day, :string
  end
end
