class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_date
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :selling_price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
    validates :selling_price, numericality: { only_integer: true }
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_date_id
  end
end
