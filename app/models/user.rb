class User < ApplicationRecord

  has_secure_password
  has_many :likes
  has_many :items, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  has_one :card, dependent: :destroy
  accepts_nested_attributes_for :card

  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  kana = /\A([ァ-ン]|ー)+\z/
  pass = /\A[a-z\d]{7,100}\z/i
  email = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  phone = /\A\d{10,11}\z/


  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, format: { with: pass }, presence: true
  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: zenkaku }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: zenkaku }
  validates :first_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :last_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true
  validates :phone_number, format: { with: phone }, presence: true
  validates :email, uniqueness: true, format: { with: email }, presence: true
end
