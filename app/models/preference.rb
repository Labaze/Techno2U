class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  belongs_to :artist, optional: true

  validates :user, presence: true
  validate :only_one_element

  private

  def only_one_element
    total = 0
    total += 1 if genre.blank? == false
    total += 1 if artist.blank? == false
    total += 1 if venue_type.blank? == false
    if total != 1
      errors[:base] << "At least one and only one element should be informed"
    end
  end
end
