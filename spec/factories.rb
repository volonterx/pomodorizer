FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    url { Faker::Internet.url }
    duration { Faker::Number.between(from: 1, to: 12) }
    start_date { Date.today }
    priority { Faker::Number.between(from: 1, to: 5) }
  end
end