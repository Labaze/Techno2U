class Artist < ApplicationRecord
  has_many :parties, through: :lineups
  has_many :users, through: :preferences
  has_many :lineups, dependent: :destroy

  has_one :genre

  validates :name, presence: true, uniqueness: true
end
