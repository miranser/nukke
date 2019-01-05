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