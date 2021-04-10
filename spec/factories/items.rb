FactoryBot.define do
  factory :item do
    product_name      {'xxx'}
    description       {'xxxx'}
    category_id       {'2'}
    condition_id      {'2'}
    charge_id         {'2'}
    area_id           {'2'}
    delivery_day_id   {'2'}
    price             {'55555'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.image.png'), filename: 'test_image.png')
    end
  end
end
