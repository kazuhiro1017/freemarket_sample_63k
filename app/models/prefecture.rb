class Prefecture < ApplicationRecord
  has_many :items

  validates :prefecture, presence: true

  

end
