class User < ApplicationRecord
  has_many :ads
  has_many :bookings
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def requested
    ads.map(&:bookings).flatten.sort
  end
end
