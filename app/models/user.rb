class User < ApplicationRecord

  #has_many :items
  #has_one :buyer

  #/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々]+\z/
  validates :family_name_kana, :give_name_kana, format: { with: VALID_NAME_REGEX }

  VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, :give_name_kana, format: { with: VALID_KANA_REGEX }

  with_options presence: true do
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
