FactoryBot.define do
  factory :book_shop do
    book {:book}
    shop {:shop}
    copies_in_stock {2}
  end
end
