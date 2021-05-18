FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  sequence :name do |n|
    "username#{n}"
  end
end

FactoryBot.define do
  factory :user, class: User do
    name 
    email
    password { '123456' }
  end
end
