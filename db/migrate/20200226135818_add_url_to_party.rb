class AddUrlToParty < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :url, :string
  end
end
