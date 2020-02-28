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
end
