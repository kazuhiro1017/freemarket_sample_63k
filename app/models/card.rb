class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :card_number, presence: true
  validates :expiry_date, presence: true
  validates :security_code, presence: true
end
