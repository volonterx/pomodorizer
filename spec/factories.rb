FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    slots { Array.new(7, 0) }
    timer_duration { 45 }
  end

  factory :course do
    user { create(:user) }
    name { Faker::Educator.course_name }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph }
    duration { Faker::Number.between(from: 1, to: 12) }
    start_date { Date.today }
    expire_date { Date.today + 1.month }
    priority { Faker::Number.between(from: 1, to: 5) }
  end
end