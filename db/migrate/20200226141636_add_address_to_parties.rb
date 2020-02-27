class AddAddressToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :address, :string
  end
end
