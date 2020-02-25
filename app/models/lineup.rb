class Lineup < ApplicationRecord
  belongs_to :artist
  belongs_to :party

  validates :party, presence: true
  validates :artist, presence: true, uniqueness: { scope: :party, message: "An artist cannot attend twice the same party" }
end
