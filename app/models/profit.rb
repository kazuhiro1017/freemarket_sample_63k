class Profit < ApplicationRecord
  has_many :items

  validates :profit, presence: true
  validates :delivery_cost, presence: true
end
