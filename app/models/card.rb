class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_number, format: { with: /\A\d{,16}\z/}, presence: true
  validates :expiry_date, presence: true
  validates :security_code, format: { with: /\A\d{3,4}\z/}, presence: true

end
