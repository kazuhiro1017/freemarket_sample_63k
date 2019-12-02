class Postage < ApplicationRecord
  has_many :items

  validates :postage, presence: true

  enum postage: {
    "---":0, "着払い(購入者負担)":1, "送料込み(出品者負担)":2
  }
end
