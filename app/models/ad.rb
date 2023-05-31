class Ad < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  CATEGORIES = %w[Excavators Loaders Paving Machines Backhoes Bulldozers Dump Trucks Trenchers Compactors Graders Telehandlers]

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence:true
  validates :category, inclusion: { in: CATEGORIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
