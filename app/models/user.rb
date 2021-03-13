class User < ApplicationRecord

  has_many :items
  has_one :buyer

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  VALID_PASSWORD_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, :give_name, :family_name_kana, :give_name_kana, format: { with: VALID_PASSWORD_REGEX }
  with_option presence: true do
    validates :nickname
    validates :family_name
    validates :give_name
    validates :family_name_kana
    validates :give_name_kana
    validates :birthday
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
