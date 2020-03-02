class AddPictureUrlToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :picture_url, :text
  end
end
