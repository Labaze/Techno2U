class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.string :venue_location
      t.string :venue_type
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
