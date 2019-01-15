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
        new_values = calculated_count(book_to_sell)
        @shop.update(books_sold_count: new_values['total_copies'])
        stocks.find_by('book_id': book_to_sell[:book_id]).update(copies_in_stock: new_values['remain_in_stock'])
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

    def sell_params(record)
      record.require(:books).permit(:book_id, :copies_sold)
      # params.permit(%i[book_id copies_sold])
    end

    def calculated_count(book)
      puts book
      values = {}
      values['total_copies'] = @shop.books_sold_count + book[:copies_sold]
      values['remain_in_stock'] = @shop.book_shops.find_by('book_id': book[:book_id]).copies_in_stock - book[:copies_sold]
      values
    end
  end
end
