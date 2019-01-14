5.times do
    Publisher.create({
        name: Faker::Book.publisher
    })
end

5.times do
    Book.create({
        title: Faker::Book.title,
        author: Faker::Book.author,
        publisher_id: Faker::Base.rand(Publisher.count)
    })
end

5.times do
    Shop.create({
        name: Faker::TwinPeaks.location,
        books_sold_count: Faker::Base.rand(100)
    })    
end
10.times do
BookShop.create({
    book_id: Faker::Base.rand(Book.count),
    shop_id: Faker::Base.rand(Shop.count),
    copies_in_stock: Faker::Base.rand(10)
})
end