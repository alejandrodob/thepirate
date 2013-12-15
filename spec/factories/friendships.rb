# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friendship do
    association :user, username: 'friendly user', email: 'friend@of.all'
    association :friend, factory: :user, username: 'Almond', email: 'b@b.b'
  end
end
