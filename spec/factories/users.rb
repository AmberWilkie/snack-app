FactoryGirl.define do
  factory :user do
    name 'Bob Fake'
    location '41463'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
