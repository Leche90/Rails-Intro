class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :cryptocurrency

  # Validations for each
  validates :amount, numericality: { greater_than: 0 }
  validates :transaction_type, presence: true, inclusion: { in: ['buy', 'sell'] }
end
