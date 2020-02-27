class Artist < ApplicationRecord
  has_many :parties, through: :lineups
  has_many :users, through: :preferences

  validates :name, presence: true, uniqueness: true
end
