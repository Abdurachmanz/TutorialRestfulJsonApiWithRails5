FactoryBot.define do
    factory :citrakara do
      title { Faker::Lorem.word }
      created_by { Faker::Number.number(10) }
    end
  end