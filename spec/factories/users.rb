FactoryGirl.define do
  factory :user do
    name 'Bob Fake'
    username { Faker::Name.name }
    location '41463'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
