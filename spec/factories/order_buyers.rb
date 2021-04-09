FactoryBot.define do
  factory :order_buyer do
    token             {'tok_abcdefghijk00000000000000000'}
    postal_code       { '333-3333' }
    shipping_area_id  { 2 }
    city              { '横浜市' }
    address           { '川崎区川崎1-1' }
    building_name     { '大山ビル' }
    phone_number      { '09012345678' }
  end

end


