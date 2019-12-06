class User < ApplicationRecord

  has_secure_password
  has_many :likes
  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :card

  kanji = /\A[一-龥]+\z/
  kana = /\A([ァ-ン]|ー)+\z/


  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, format: { with: /[a-z\d]{7,100}/i}, presence: true
  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :first_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :last_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true, presence: true
end
