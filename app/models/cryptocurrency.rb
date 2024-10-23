class Cryptocurrency < ApplicationRecord
  has_many :transactions
  has_and_belongs_to_many :users
  has_and_belongs_to_many :exchanges

  # Validations
  validates :name, presence: true
  validates :symbol, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :market_cap, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
