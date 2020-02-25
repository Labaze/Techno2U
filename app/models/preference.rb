class Preference < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  belongs_to :artist, optional: true

  validates :user, presence: true
  validate :has_content

  private

  def has_content
    if genre.blank? && artist.blank? && venue_type.blank?
      errors[:base] = "A preference should have at least one element."
    else genre.blank? == false || artist.blank? == false || venue_type.blank? == false@
    end
  end

end
