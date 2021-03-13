class User < ApplicationRecord

  has_many :items
  has_one :buyer

  validates :nickname,            presence: true
  validates :email,               presence: true
  validates :encrypted_password,  presence: true
  validates :family_name,         presence: true
  validates :give_name,           presence: true
  validates :family_name_kana,    presence: true
  validates :give_name_kana,      presence: true
  validates :birthday,            presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
