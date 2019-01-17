# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::ShopsController, type: :request do
  let!(:shop_one) { create(:shop) }
  let!(:shop_two) { create(:shop) }
  let!(:book_one) { create(:book) }
  let!(:book_two) { create(:book) }
  let!(:stock_one) { create(:book_shop, shop: shop_one, book: book_one, copies_in_stock: 5) }
  let!(:stock_two) { create(:book_shop, shop: shop_one, book: book_two, copies_in_stock: 5) }

  describe '#index' do
    it 'sends all shops' do
      get '/api/shops'

      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json['data'].count).to eq(2)
    end
  end
  describe '#show:id' do
    it 'sends shop' do
      get "/api/shops/#{shop_one.id}"

      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #shop:id' do
    context 'when params are valid' do
      let(:valid_params) do
        {
          books: [
             {
              book_id: book_one.id,
              copies_sold: 1
            },
            {
              book_id: book_two.id,
              copies_sold: 2
            }
          ]
        }
      end
      it 'respond with 204' do
        put "/api/shops/#{shop_one.id}/sell", params: valid_params, as: :json

        expect(response).to have_http_status :no_content
      end
      it 'changes sold count' do
        put "/api/shops/#{shop_one.id}/sell", params: valid_params, as: :json

        expect { shop_one.reload }.to change(shop_one, :books_sold_count).by(3)
      end

      it 'changes copies in stock' do
      # is_expected.to change(shop_one.book_shops.find_by('book_id': book_one.id), :copies_in_stock).by(-1)
        put "/api/shops/#{shop_one.id}/sell", params: valid_params, as: :json
        
        expect {stock_one.reload}.to change(stock_one, :copies_in_stock).by(-1)
      end
    end

    context 'when params aren\'t valid' do
      let(:invalid_params) { { foo: 'bar', bar: 'foo' } }
      it 'respond with 422' do
        put "/api/shops/#{shop_one.id}/sell", params: invalid_params, as: :json

        expect(response).to have_http_status :unprocessable_entity
      end
    end
  end
end
