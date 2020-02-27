class AddDescriptionToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :descprition, :text
  end
end
