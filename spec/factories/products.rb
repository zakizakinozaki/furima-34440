FactoryBot.define do
    factory :product do
    name           { 'test' }
    description    { 'test' }
    category_id    { 2 }
    status_id      { 2 }
    cost_id        { 2 }
    state_id       { 2 }
    day_id         { 2 }
    price          { 3000 }
    association :user


    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
