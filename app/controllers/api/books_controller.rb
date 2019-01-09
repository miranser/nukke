module Api
    class BooksController < ApplicationController
        def index
            @books = Book.all
            render json: @books, each_serializer: BookSerializer 
        end
        
        def show
            render json: @book, serializer: BookSerializer
        end

    end
end