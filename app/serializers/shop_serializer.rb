# frozen_string_literal: true

class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :books_sold_count, :books_in_stock

  def books_in_stock
    custom_books = []

    object.book_shops.each do |stock|
      custom_book = stock.book.attributes.slice('id', 'title')
      custom_book[:copies_in_stock] = stock.copies_in_stock

      custom_books.push(custom_book)
    end
    custom_books
  end
end
