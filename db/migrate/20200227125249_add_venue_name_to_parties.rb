class AddVenueNameToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :venue_name, :string
  end
end
