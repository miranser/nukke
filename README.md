# Test exam on Backend Ruby on Rails developer 
```
Ruby version: 2.5.3
Rails version: 5.2.2
RSpec version: 3.8
```
# Used gems:

[Faker](https://github.com/stympy/faker) - to populate database with data

[FactoryBot](https://github.com/thoughtbot/factory_bot) - for creating test fixtures

[ActiveModelSerializers](https://github.com/rails-api/active_model_serializers) - for handfull data serialization

# API

Exam application is available at [Heroku](https://calm-retreat-63472.herokuapp.com)

Described Endpoit 1 is available at /api/publishers/X, where X is publisher's id

Described Endpoit 2 is available at /api/shops/X/sell, where X is shop's id

it requieres json in following format:
```json
{ 
       "books": [
          {
           "book_id": 1,
           "copies_sold": 1
          },
          {
           "book_id": 7,
           "copies_sold": 2
            },
            ...
          ]
        
}
```
