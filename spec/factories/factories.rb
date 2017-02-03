FactoryGirl.define do

  factory :restaurant do
    name { Faker::Company.name }
    url { Faker::Internet.url('yelp.com') }
    address { "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip}" }

    factory :restaurant_with_reviews do
      after(:create) do |restaurant, evaluator|
        create_list(:review, 10, restaurant: restaurant)
      end
    end
  end

  factory :review do
    content { Faker::Lorem.paragraph }
    rating { (0..5).to_a.sample }
  end

end
