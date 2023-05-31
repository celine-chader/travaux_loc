class Ad < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  CATEGORIES = %w[Excavators Loaders Paving Machines Backhoes Bulldozers Dump Trucks Trenchers Compactors Graders Telehandlers]

  validates :name, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :address, presence: true
end
