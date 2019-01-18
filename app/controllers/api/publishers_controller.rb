# frozen_string_literal: true

module Api
  class PublishersController < ApplicationController
    before_action :set_publisher, only: %i[show update]

    def index
      @publishers = Publisher.all
      render json: @publishers, each_serializer: PublisherSerializer, adapter: :json
    end

    def show
      shops = Shop.joins(:books)
                  .where(books: { publisher_id: params[:id] })
                  .order(:books_sold_count).distinct

      render json: shops, each_serializer: ShopSerializer, adapter: :json
    end

    def create
      @publisher = Publisher.new(publisher_params)
      if @publisher.save
        head :created
      else
        head :unprocessable_entity
      end
    end

    private

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    def publisher_params
      params.permit(:name)
    end
  end
end
