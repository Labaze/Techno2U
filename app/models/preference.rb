class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  belongs_to :artist
end
