FactoryBot.define do
  factory :book do
    title {'title'}
    author {'author'}
    association :publisher, factory: :publisher
  end
end
