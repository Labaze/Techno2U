class AddImageUrlToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :image_url, :text
  end
end
