include ActiveModel::Serialization
module Api
  class BooksController < ApplicationController
   
    before_action :set_book, only: [:show]
    
  
    def index
      @books = Book.all
      render json: @books, each_serializer: BookSerializer
    end

    def show
      render json: @book, serializer: BookSerializer
    end

    def create
        @book = Book.new(book_params)
        if @book.save
            render json: @book, serializer: BookSerializer
        else
            render json: {status: "ERROR", message: "Book is not saved", data: @book.errors}
        end
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.permit(:title, :author, :publisher_id)
    end
  end
end