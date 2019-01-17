# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PublishersController, type: :request do
  describe 'Publisher GET request' do
    before do
      @publisher_one = create(:publisher)
      @publisher_two = create(:publisher)
    end

    it 'sends all publishers' do
      get '/api/publishers'

      expect(response).to have_http_status(:success)

      json = JSON.parse(response.body)
      expect(json['data'].count).to eq(2)
    end

    it 'shows specific publisher' do
      get "/api/publishers/#{@publisher_one.id}"

      expect(response).to have_http_status(:success)
    end
  end
  describe 'Publishers POST request' do
    before do
      @publisher = create(:publisher)
    end
    let(:valid_params) do
      {
        name: 'publisher'
      }
    end

    let(:invalid_params) do
      { foo: 'bar',
        bar: 'foo' }
    end

    it 'creates publisher with valid params' do
      expect do
        post '/api/publishers', params: valid_params, as: :json

        expect(response).to have_http_status(:success)

      end.to change(Publisher, :count).by(+1)
    end

    it 'returns 422 with invalid params' do
      post '/api/publishers', params: invalid_params, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
