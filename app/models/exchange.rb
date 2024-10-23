class Exchange < ApplicationRecord
  has_and_belongs_to_many :cryptocurrencies

  # Validations
  validates :name, presence: true
  validates :location, presence: true
  validates :latitude, :longitude, numericality: true, allow_nil: true
end
