class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :selling_price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
    validates :price, numericality: { only_integer: true }
end
