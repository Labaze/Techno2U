class AddFacebookLinkToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :facebook_link, :text
  end
end
