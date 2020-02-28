class Artist < ApplicationRecord
  has_many :parties, through: :lineups
  has_many :users, through: :preferences
  has_many :lineups, dependent: :destroy
  has_many :preferences, dependent: :destroy

  belongs_to :genre, optional: true

  validates :name, presence: true, uniqueness: true
end
