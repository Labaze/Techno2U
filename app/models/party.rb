class Party < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :genre
  has_many :lineups
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
