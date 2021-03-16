FactoryBot.define do
  factory :item do
    name                { 'aaaaa' }
    description         { 'aaaa' }
    category_id         { '2' }
    status_id           { '2' }
    shipping_charge_id  { '2' }
    prefecture_id       { '2' }
    days_to_ship_id     { '2' }
    price               { '2000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
