class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings

  default_scope { order(name: :asc) }

  STYLES = %w(Abstract Abstraction Expressionism Impressionism Modernism Painterly Photorealism Realism)
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :style,
            presence: true,
            inclusion: { in: STYLES, message: "Part of the list" }
end
