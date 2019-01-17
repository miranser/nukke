# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::BooksController, type: :request do
  before do
      @book_one = create(:book)
      @book_two = create(:book)
    end

  describe '#index' do
    
    it 'send all books' do
      get '/api/books'

      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json['data'].count).to eq(2)
    end
  end
  describe '#index:id' do
    it 'shows specific book' do
      get "/api/books/#{@book_one.id}"

      expect(response).to have_http_status(:success)
    end
  end
  describe '#create' do
    before do
      @publisher = create(:publisher)
    end
    let(:valid_params) do
      {
        title: 'book of the man',
        author: 'man',
        publisher_id: @publisher.id
      }
    end

    let(:invalid_params) do
      { foo: 'bar' }
    end

    it 'creates book with valid params' do
      expect do
        post '/api/books', params: valid_params, as: :json

        expect(response).to have_http_status(:success)
      end.to change(Book, :count).by(+1)
    end

    it 'returns 422 with invalid params' do
      post '/api/books', params: invalid_params, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
