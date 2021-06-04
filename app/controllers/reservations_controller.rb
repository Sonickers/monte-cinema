class ReservationsController < ApplicationController
  def index
    @reservations = Reservations::UseCases::FetchAll.new.call
    render json: Reservations::Representers::List.new(@reservations).basic
  end

  def show
    @reservations = Reservations::UseCases::Find.new.call(id: params[:id])
    render json: Reservations::Representers::Single.new(@reservations).basic
  end

  def create
    @reservation = Reservations::UseCases::Create.new.call(params: reservation_params)

    if @reservation.valid?
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservations::UseCases::Update.new.call(id: params[:id], params: reservation_params)

    if @reservation.valid?
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Reservations::UseCases::Delete.new.call(id: params[:id])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_status_id, :seance_id, :ticket_desk_id)
  end
end
