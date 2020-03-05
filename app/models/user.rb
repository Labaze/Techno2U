class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :preferences, dependent: :destroy
  has_many :attendings
  has_many :parties, through: :attendings
  has_many :preferences
  has_many :genres, through: :preferences

  def attended?(party)
    self.parties.each do |user_party|
      return true if user_party.id == party.id
    end
    return false
  end

  def get_attending_from_party(party)
    attending = Attending.where(user_id: self.id).where(party_id: party.id).first
    return attending
  end
end

