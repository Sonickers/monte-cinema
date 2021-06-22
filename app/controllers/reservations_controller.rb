class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    authorize Reservation
    @reservations = policy_scope(Reservations::UseCases::FetchAll.new.call)
    render json: Reservations::Representers::List.new(@reservations).basic
  end

  def show
    @reservation = Reservations::UseCases::Find.new(id: params[:id]).call
    authorize @reservation
    render json: Reservations::Representers::Single.new(@reservation).extended
  end

  def create_online
    authorize Reservation
    create_by_connection(Reservations::UseCases::CreateOnline, online_params.merge(user: current_user))
  end

  def create_offline
    authorize Reservation
    create_by_connection(Reservations::UseCases::CreateOffline, offline_params)
  end

  def update
    @reservation = Reservations::Repository.new.find(params[:id])
    authorize @reservation

    @reservation = Reservations::UseCases::Update.new(id: params[:id], params: update_params).call

    if @reservation.valid?
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservations::Repository.new.find(params[:id])
    authorize @reservation

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

  def create_by_connection(use_case, connection_params)
    @reservation = use_case.new(params: connection_params).call

    if @reservation.valid?
      render json: @reservation, status: :created, location: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  rescue Tickets::UseCases::Create::SeatsNotAvailableError => e
    render json: { error: e.message }.to_json, status: :unprocessable_entity
  end
end
