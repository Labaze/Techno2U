class FixColumnName < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :parties, :descprition, :description
  end
end
