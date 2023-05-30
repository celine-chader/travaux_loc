class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ad

  validates :availability, presence: true
  validates :user_id, presence: true
  validates :ad_id, presence: true
end
