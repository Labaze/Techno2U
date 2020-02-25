class Genre < ApplicationRecord
  has_many :users, through: :preferences

  belongs_to :artist
  belongs_to :party

  validates :name, presence: true, uniqueness: true
end
