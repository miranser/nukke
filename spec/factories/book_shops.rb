# frozen_string_literal: true

FactoryBot.define do
  factory :book_shop do
    book
    shop
    copies_in_stock { 2 }
  end
end
