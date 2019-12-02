class DeliveryMethod < ApplicationRecord
  has_many :items

  validates :method, presence: true

  enum method: {
    "---":0, "未定":1, "らくらくメルカリ便":2, "ゆうメール":3, "レターパック":4,
    "普通郵便(定形、定形外)":5, "クロネコヤマト":6, "ゆうパック":7,
    "クリックポスト":8, "ゆうパケット":9
  }
end
