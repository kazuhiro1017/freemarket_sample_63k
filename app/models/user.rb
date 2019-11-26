class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         kanji = /\A[一-龥ぁ-ん]/
         kana = /\A[ァ-ヶー－]+\z/


  validates :password, format: { with: /\A[a-z\d]{7,100}+\z/i}, presence: true
  validates :password_confirmation, format: { with: /\A[a-z\d]{7,100}+\z/i}, presence: true
  validates :nickname, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: kanji }
  validates :first_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :last_name_kana, presence: true, length: { maximum: 15 }, format: { with: kana }
  validates :birthday, presence: true
  validates :phone_number, presence: true
  validates :email, uniqueness: true, presence: true

  
end
