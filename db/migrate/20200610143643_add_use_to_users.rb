class AddUseToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :use, :string
  end
end
