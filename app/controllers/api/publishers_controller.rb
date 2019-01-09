module Api
    class PublishersController < ApplicationController
        def index
            @publishers = Publisher.all
            render json: @publishers, each_serializer: PublisherSerializer 
        end
        
        def show
            render json: @publisher, serializer: PublisherSerializer
        end

    end
end