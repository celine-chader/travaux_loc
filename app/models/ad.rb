class Ad < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  CATEGORIES = ["Diable", "Remorque", "Burineur perforateur", "Bétonnière", "Nettoyeur haute pression", "Mini pelle", "Tondeuse", "Ponceuse girafe", "Broyeur végétaux", "Lève plaque"]

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence:true
  validates :category, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { greater_than: 0 }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_category,
  against: [ :name, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  def requested_bookings
    bookin
  end
end
