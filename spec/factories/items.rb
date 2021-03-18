FactoryBot.define do
  factory :item do
    name                {'test'}
    description         {'test'}
    category_id            { 2 }
    item_status_id         { 2 }
    shipping_charge_id     { 2 }
    shipping_area_id       { 2 }
    shipping_date_id       { 2 }
    selling_price     { 300 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end