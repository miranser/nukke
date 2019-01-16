# frozen_string_literal: true

module Api
  class ShopsController < ApplicationController
    before_action :set_shop, only: %i[show info sell]
    def index
      @shops = Shop.all
      render json: @shops, each_serializer: ShopSerializer
    end

    def show
      render json: @shop, serializer: ShopSerializer
    end

    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        render json: @shop, serializer: ShopSerializer
      else
        render json: { message: 'Shop is not saved', data: @shop.errors },
               status: 422
      end
    end

    def sell
      stocks = @shop.book_shops

      params[:books].each do |book_to_sell|
        @shop.increment!(:books_sold_count, book_to_sell[:copies_sold])
        stocks.find_by('book_id': book_to_sell[:book_id])
              .decrement!(:copies_in_stock, book_to_sell[:copies_sold])
      end

      if @shop.save
        render json: @shop, serializer: ShopSerializer
      else
        render json: { message: 'Books can\'t be sold', data: @shop.errors },
               status: 422
      end
    end

    private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.permit(:name)
    end

    
  end
end
