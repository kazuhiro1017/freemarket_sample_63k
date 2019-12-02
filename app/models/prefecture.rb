class Prefecture < ApplicationRecord
  has_many :items
  has_many :addresses

  validates :prefecture, presence: true

  

end
