FactoryBot.define do
  factory :order do
    postal_code    {'123-4567'}
    area_id    {2}
    municipalities   {'テスト'}
    street_num {'テスト1-1'}
    phone_num{'00000000'}
  end
end