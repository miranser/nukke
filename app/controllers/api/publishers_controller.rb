# frozen_string_literal: true

module Api
  class PublishersController < ApplicationController
    before_action :set_publisher, only: %i[show update info]

    def index
      @publishers = Publisher.all
      render json: @publishers, each_serializer: PublisherSerializer
    end

    def show
      shops = Shop.joins(:books)
                  .where(books: { publisher_id: params[:id] })
                  .order(:books_sold_count).distinct

      render json: shops, each_serializer: ShopSerializer
    end

    def create
      @publisher = Publisher.new(publisher_params)
      if @publisher.save
        render json: @publisher, serializer: PublisherSerializer
      else
        render json: { message: 'Publisher is not saved',
                       data: @publisher.errors }, status: 422
      end
    end

    def info
      render json: @books
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
