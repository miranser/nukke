module Api
    class ShopsController < ApplicationController
        before_action :set_shop
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
                render json: {status: "ERROR", message: "Shop is not saved", data: @shop.errors}
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