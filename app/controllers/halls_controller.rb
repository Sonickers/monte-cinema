class HallsController < ApplicationController
    before_action :set_hall, only: [:show, :update, :destroy]

    def index
        render json: Halls::UseCases::FetchAll.new.call
    end
    
    def create
        @hall = Hall.new(hall_params)

        if @hall.save
            render json: @hall, status: :created, location: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def update
        if @hall.update(hall_params)
            render json: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @hall.destroy
    end

    private
    
    def hall_params
        params.require(:hall).permit(:name, :seats)
    end

    def set_hall
        @hall = Hall.find(params[:id])
    end
end