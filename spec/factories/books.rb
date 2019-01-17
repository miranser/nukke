# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { 'title' }
    author { 'author' }
    association :publisher, factory: :publisher
  end
end
