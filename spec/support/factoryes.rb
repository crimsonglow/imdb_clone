FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "admin1231" }
    password_confirmation { "admin1231"}
     factory :admin do
       after(:create) {|user| user.add_role(:admin)}
    end
  end

  factory :movie do
    title { 'Riddick' }
    category { "action" }
    description { "Left for dead on a sun-scorched planet"}
  end
end
