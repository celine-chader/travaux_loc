class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :ad

  validates :user_id, presence: true
  validates :ad_id, presence: true
end
