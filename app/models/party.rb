class Party < ApplicationRecord
  belongs_to :genre
  has_many :users, through: :attendings
  has_many :artists, through: :lineups

  validates :name, presence: true
  validates :venue_type, presence: true
  validates :venue_location, presence: true

  private

  def end_after_begin
    if :end_time >= :start_time
      errors.add(:end_time, "Must be later than starting time")
    end
  end

end
