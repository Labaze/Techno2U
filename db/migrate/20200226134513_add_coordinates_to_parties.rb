class AddCoordinatesToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :latitude, :float
    add_column :parties, :longitude, :float
  end
end
