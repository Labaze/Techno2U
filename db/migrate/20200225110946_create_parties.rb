class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.datetime :begin
      t.datetime :end
      t.string :venue_location
      t.string :venue_type
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
