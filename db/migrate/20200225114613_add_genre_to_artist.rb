class AddGenreToArtist < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :genre, foreign_key: true
  end
end
