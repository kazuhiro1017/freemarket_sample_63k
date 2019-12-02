class Size < ApplicationRecord
  has_many :items

  # validates :size, presence: true サイズの表示がない時に聞いてしまうかも。。。

  enum size: {
    "---":0, "XXS以下":1, "XS(SS)":2, "S":3,
    "M":4, "L":5, "XL(LL)":6, "2XL(3L)":7, "3XL(4L)":8,
    "4XL(5L)以上":8, "FREE SIZE":9
  }
end
