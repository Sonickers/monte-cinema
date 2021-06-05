class ReservationsController < ApplicationController
  def index
    @reservations = Reservations::UseCases::FetchAll.new.call
    render json: Reservations::Representers::List.new(@reservations).basic
  end

  def show
    @reservations = Reservations::UseCases::Find.new(id: params[:id]).call
    render json: Reservations::Representers::Single.new(@reservations).extended
  end

  def create_online
    @reservation = Reservations::UseCases::CreateOnline.new(params: online_params).call

    if @reservation.valid?
      representation = Reservations::Representers::Single.new(@reservation).extended
      render json: representation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def create_offline
    @reservation = Reservations::UseCases::CreateOffline.new(params: offline_params).call

    if @reservation.valid?
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    @reservation = Reservations::UseCases::Update.new(id: params[:id], params: update_params).call

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

  def update_params
    params.require(:reservation).permit(:reservation_status_id)
  end

  def online_params
    params.permit(:seance_id, tickets: %i[seat ticket_type_id])
  end

  def offline_params
    params.permit(:reservation_status_id, :seance_id, :ticket_desk_id, tickets: %i[seat ticket_type_id])
  end
end
