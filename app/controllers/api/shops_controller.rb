module Api
    class ShopsController < ApplicationController
        def index
            @shops = Shop.all
            render json: @shops, each_serializer: ShopSerializer
        end
        
        def show
            render json: @shop, serializer: ShopSerializer
        end

    end
end