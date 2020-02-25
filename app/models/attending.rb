class Attending < ApplicationRecord
  belongs_to :party
  belongs_to :user

  validates :party, presence: true
  validates :user, presence: true, uniqueness: { scope: :party, message: "A user cannot attend twice the same party" }
end
