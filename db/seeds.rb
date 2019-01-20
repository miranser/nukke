# frozen_string_literal: true

5.times do
  Publisher.create(
    name: Faker::Book.publisher
  )
end

5.times do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    publisher_id: Faker::Base.rand(Publisher.count)
  )
end

5.times do
  Shop.create(
    name: Faker::TwinPeaks.location,
    books_sold_count: Faker::Base.rand(100)
  )
end
10.times do |i|
  book_ids = (0...Book.count).to_a.shuffle
  shop_ids = (0...Shop.count).to_a.shuffle
  BookShop.create(
    book_id: Faker::Base.rand(book_ids[i]),
    shop_id: Faker::Base.rand(shop_ids[i]),
    copies_in_stock: Faker::Base.rand(10)
  )
end
