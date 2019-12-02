class DeliveryDay < ApplicationRecord
  has_many :items

  validates :days, presence: true

  enum days: {
    "---":0, "1~2日で発送":1, "2~3日で発送":2, "4~7日で発送":3
  }

end


