class User < ApplicationRecord
  has_many :items
  has_one  :buyer

  validates :password,format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  with_options format:  {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
    validates :family_name 
    validates :give_name
  end
  with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :family_name_kana 
    validates :give_name_kana
  end
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :give_name
    validates :family_name_kana
    validates :give_name_kana
    validates :birthday
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
