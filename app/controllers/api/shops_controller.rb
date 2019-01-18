# frozen_string_literal: true

# require 'services/sell_controller.rb'
module Api
  class ShopsController < ApplicationController
    before_action :set_shop, only: %i[show info sell]
    def index
      @shops = Shop.all
      render json: @shops, each_serializer: ShopSerializer, adapter: :json
    end

    def show
      render json: @shop, serializer: ShopSerializer, adapter: :json
    end

    def create
      @shop = Shop.new(shop_params)
      if @shop.save
        head :created
      else
        head :unprocessable_entity
       
      end
    end

    def sell
      if SellService.sell(@shop, sell_params)
        head :no_content
      else
        head :unprocessable_entity
      end
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { message: 'Books can\'t be sold', data: invalid.record.errors },
             status: :unprocessable_entity
    end

    private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      defaults = { books_sold_count: 0 }
      
      params.permit(:name).reverse_merge(defaults)
    end

    def sell_params
      params.permit(books: %i[book_id copies_sold])
    end
  end
end
