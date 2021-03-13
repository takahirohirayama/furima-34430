FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'hoge123'}
    password_confirmation {password}
    family_name           {'性'}
    first_name            {'名'}
    family_name_kana      {'セイ'}
    first_name_kana       {'メイ'}
    birthday              {'1931-01-01'}
  end
end