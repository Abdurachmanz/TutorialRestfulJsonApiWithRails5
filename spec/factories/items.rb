FactoryBot.define do
    factory :item do
      name { Faker::StarWars.character }
      done false
      citrakara_id nil
    end
  end