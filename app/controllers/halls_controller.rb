class HallsController < ApplicationController
    def index
        @halls = UseCases::Halls::FetchAll.new.call
        render json: Representers::Halls.new(@halls).basic
    end

    def show
        @hall = UseCases::Halls::Find.new.call(id: params[:id])
        render json: Representers::Hall.new(@hall).basic
    end
    
    def create
        @hall = UseCases::Halls::Create.new.call(params: hall_params)

        if @hall.valid?
            render json: @hall, status: :created, location: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def update
        @hall = UseCases::Halls::Find.new.call(id: params[:id])
        
        if UseCases::Halls::Update.new.call(hall: @hall, params: hall_params)
            render json: @hall
        else
            render json: @hall.errors, status: :unprocessable_entity
        end
    end

    def destroy
        UseCases::Halls::Delete.new.call(id: params[:id])
    end

    private
    
    def hall_params
        params.require(:hall).permit(:name, :seats)
    end
end