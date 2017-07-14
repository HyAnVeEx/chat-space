 FactoryGirl.define do
  factory :user do
    id 1
    name Faker::Name.name
    email                 Faker::Internet.free_email
    password              Faker::Internet.password
    password_confirmation Faker::Internet.password
  end
end
