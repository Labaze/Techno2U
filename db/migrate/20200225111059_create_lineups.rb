class CreateLineups < ActiveRecord::Migration[5.2]
  def change
    create_table :lineups do |t|
      t.references :artist, foreign_key: true
      t.references :party, foreign_key: true

      t.timestamps
    end
  end
end
