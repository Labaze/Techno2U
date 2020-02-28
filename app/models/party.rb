class Party < ApplicationRecord
  geocoded_by :venue_location
  after_validation :geocode, if: :will_save_change_to_venue_location?

  belongs_to :genre
  has_many :lineups, dependent: :destroy
  has_many :users, through: :attendings
  has_many :lineups, dependent: :destroy
  has_many :attendings, dependent: :destroy
  has_many :artists, through: :lineups

  validates :name, presence: true
  validates :venue_location, presence: true

  private

  def end_after_begin
    if :end_time >= :start_time
      errors.add(:end_time, "Must be later than starting time")
    end
  end

end
