class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ad

  validates :availability, presence: true
end
