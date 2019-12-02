class Item < ApplicationRecord
  belongs_to :brand_sub
  belongs_to :postage
  belongs_to :delivery_method
  belongs_to :category, dependent: :destroy
  belongs_to :prefecture
  has_many :images, dependent: :destroy
  belongs_to :profit
  belongs_to :delivery_day
  belongs_to :user
  belongs_to :size
  has_many :likes, dependent: :destroy
  has_one :transaction, dependent: :destroy
  belongs_to :condition

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :delivery_method_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :profit_id, presence: true
end
