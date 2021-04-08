class OrderBuyer 
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :city, :address, :phone_number, :building_name, :user_id, :item_id

  with_options presence: true do
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :city,             format:       { with: /\A[ぁ-ん一-龥]+\z/ }
    validates :address
    validates :phone_number,     format:       { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :postal_code,      format:       { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :item_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    order = Order.create(postal_code: postal_code, shipping_area_id: shipping_area_id, address: address, city: city, phone_number: phone_number, building_name: building_name, buyer_id: buyer.id)
  end
end



