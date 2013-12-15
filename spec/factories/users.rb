# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "a@a.a"
    password "1111111111"
    username "john doe"
  end
end
