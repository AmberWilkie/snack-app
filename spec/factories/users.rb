FactoryGirl.define do
  factory :user do
    name 'Bob Fake'
    location '41463'
    # email { Faker::Internet.email }
    email 'email@random.com'
    password 'password'
    password_confirmation 'password'
  end
end
