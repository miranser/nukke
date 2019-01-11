module Api
    class PublishersController < ApplicationController
        before_action :set_publisher, only: [:show, :update]
        
        def index
            @publishers = Publisher.all
            render json: @publishers, each_serializer: PublisherSerializer
        end
        
        def show
            render json: @publisher, serializer: PublisherSerializer
        end

        def create
            @publisher = Publisher.new(publisher_params)
            if @publisher.save
                render json: @publisher, serializer: PublisherSerializer
            else
                render json: {status: "ERROR", message: "Publisher is not saved", data: @publisher.errors}
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