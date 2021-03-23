FactoryBot.define do
  factory :purchase_address do
    post_cord     { '123-4567' }
    prefecture_id { 1 }
    city          { '東京都' }
    address       { '1-1' }
    building      { '東京ハイツ' }
    phone_num     { '11111111111' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
