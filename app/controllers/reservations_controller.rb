class ReservationsController < ApplicationController
  def index
    @reservations = Reservations::UseCases::FetchAll.new.call
    render json: Reservations::Representers::List.new(@reservations).basic
  end

  def show
    @reservations = Reservations::UseCases::Find.new(id: params[:id]).call
    render json: Reservations::Representers::Single.new(@reservations).basic
  end

  def create
    @reservation = Reservations::UseCases::Create.new(params: reservation_params).call

    if @reservation.valid?
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservations::UseCases::Update.new(id: params[:id], params: reservation_params).call

    if @reservation.valid?
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Reservations::UseCases::Cancel.new(id: params[:id]).call
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_status_id, :seance_id, :ticket_desk_id)
  end
end
