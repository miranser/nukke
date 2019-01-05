module Api
    class BooksController < ApplicationController
        def index
            books = Book.select('books.id', 'books.title', 'books.author', 'publishers.name AS publusher').joins(:publisher)
            render json:{ message:'here is the books', data: books}, status: :ok     
        end
    end
end