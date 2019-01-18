# frozen_string_literal: true

module Api
  class BooksController < ApplicationController
    before_action :set_book, only: [:show]

    def index
      @books = Book.all
      render json: @books, each_serializer: BookSerializer, adapter: :json
    end

    def show
      render json: @book, serializer: BookSerializer, adapter: :json
    end

    def create
      @book = Book.new(book_params)
      if @book.save
        head :created
      else
        head :unprocessable_entity
      end
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.permit(:title, :author, :publisher_id, :book)
    end
  end
end
