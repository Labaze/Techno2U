class Party < ApplicationRecord
  belongs_to :genre
  has_many :users, through: :attendings
  has_many :artists, through: :lineups

  validates :name, presence: true
  validates :venue_type, presence: true
  validates :venue_location, presence: true

  private

  def end_after_begin
    if :end >= :start
      errors.add(:end, "Must be later than begin")
    end
  end

end
