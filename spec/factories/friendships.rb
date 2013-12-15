# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    association :user
    association :friend, factory: :user, nickname: "Almond", email: "b@b.b"
  end
end