FactoryBot.define do
  factory :purchase_address do
    postal_code {'123-4567'}
    area_id {1}
    city {'東京都'}
    building_name {'建物名'}
    house_number {1-1}
    telephone_number {'09012345678'}
    building_name {''}
    token {'tok_' + Faker::Lorem.characters}

    
  end
end
