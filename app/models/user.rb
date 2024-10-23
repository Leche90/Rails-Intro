class User < ApplicationRecord
  has_many :transactions
  has_and_belongs_to_many :cryptocurrencies

  # Validations for each
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
