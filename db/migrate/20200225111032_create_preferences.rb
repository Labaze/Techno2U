class CreatePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :preferences do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.string :venue_type
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end