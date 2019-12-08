class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_number, format: { with: /\d{,16}/}, presence: true
  validates :expiry_date, presence: true
  validates :security_code, format: { with: /\d{3,4}/}, presence: true

end
