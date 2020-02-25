class Artist < ApplicationRecord
  has_many :parties, through: :lineups
  has_many :users, through: :preferences
  belongs_to :genre

  validates :name, presence: true, uniqueness: true
end
