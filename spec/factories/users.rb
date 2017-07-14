 FactoryGirl.define do
  factory :user do
    id 1
    name Faker::Name.name
    email                 "kkk@gmail.com"
    password              "00000000"
    password_confirmation "00000000"
  end
end
