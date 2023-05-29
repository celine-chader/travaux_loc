class Ad < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :availability, presence: true
  validates :description, presence: true
end
