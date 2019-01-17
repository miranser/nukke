# frozen_string_literal: true

# require 'services/sell_controller.rb'
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
    end

    private

    def set_shop
      @shop = Shop.find(params[:id])
    end

    def shop_params
      params.permit(:name)
    end

    def sell_params

      params.permit(books: %i[book_id copies_sold])
    end
  end
end
