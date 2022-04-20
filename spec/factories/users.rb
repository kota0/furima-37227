FactoryBot.define do
  factory :user do
    nickname                {'test'}
    email                   {Faker::Internet.free_email}
    # password                {Faker::Internet.password(min_length: 6, min_alpha: 1, min_numeric: 1)}
    password                {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation   {password}
    first_name              {'全角'}
    last_name               {'全角'}
    first_name_kana         {'カナ'}
    last_name_kana          {'カナ'}
    birthday                {'2000-12-22'}
  end
end