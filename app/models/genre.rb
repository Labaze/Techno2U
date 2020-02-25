class Genre < ApplicationRecord
  has_many :users, through: :preferences

  has_many :artist
  has_many :party

  validates :name, presence: true, uniqueness: true
end
