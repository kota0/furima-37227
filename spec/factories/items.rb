FactoryBot.define do
  factory :item do
    product_name { 'name' }
    category_id                          { '2' }
    situation_id                         { '2' }
    pay_for_id                           { '2' }
    shipping_data_id                     { '2' }
    area_id                              { '2' }
    price                                { Faker::Number.between(from: 300, to: 9_999_999) }
    description_of_item                  { '商品です' }
    
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
