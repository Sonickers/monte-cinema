class SeancesController < ApplicationController
  before_action :set_seance, only: %i[show update destroy]

  def index
    @seances = Seance.all

    render json: @seances
  end

  def show
    render json: @seance
  end

  def create
    @seance = Seance.new(seance_params)

    if @seance.save
      render json: @seance, status: :created, location: @seance
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def update
    if @seance.update(seance_params)
      render json: @seance
    else
      render json: @seance.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @seance.destroy
  end

  private

  def set_seance
    @seance = Seance.find(params[:id])
  end

  def seance_params
    params.require(:seance).permit(:date, :time, :movie_id, :hall_id)
  end
end
