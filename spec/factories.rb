FactoryBot.define do
  factory :category do
    name { Faker::ProgrammingLanguage.name }
  end

  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph_by_chars }
    status { (0..1).to_a.sample }
  end

  factory :user do
    email { 'tilfy@test.com' }
    password { '123456' }
  end

  factory :user_like do
  end

end