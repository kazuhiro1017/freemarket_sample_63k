class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         kanji = /\A[一-龥]+\z/
         kana = /\A([ァ-ン]|ー)+\z/

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :password, format: { with: /\A[a-z\d]{7,100}+\z/i}, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true
  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :first_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :last_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true, presence: true


  
end
