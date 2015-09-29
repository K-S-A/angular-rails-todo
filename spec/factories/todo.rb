FactoryGirl.define do
  factory :todo do
    title { Faker::Name.title }
    description { Faker::Lorem.paragraph }
    priority { Faker::Number.between(0, 5) }
    status { %w(active finished).sample }
    due_date { Faker::Date.forward(23) }
    user
  end

end
