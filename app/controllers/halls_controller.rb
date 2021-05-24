class HallsController < ApplicationController
    def index
        render json: Halls::UseCases::FetchAll.new.call
    end
    
    def create
        @hall = Halls::UseCases::Create.new.call(params: hall_params)

        if @hall.valid?
            render json: @hall, status: :created, location: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def update
        @hall = Halls::UseCases::Find.new.call(id: params[:id])
        
        if Halls::UseCases::Update.new.call(hall: @hall, params: hall_params)
            render json: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def destroy
        Halls::UseCases::Delete.new.call(id: params[:id])
    end

    private
    
    def hall_params
        params.require(:hall).permit(:name, :seats)
    end
end