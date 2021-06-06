module Reservations
  class TicketsController < ApplicationController
    def index
      @tickets = Tickets::UseCases::FetchAll.new(reservation_id: params[:reservation_id]).call
      render json: Tickets::Representers::List.new(@tickets).basic
    end

    def show
      @ticket = Tickets::UseCases::Find.new(id: params[:id], reservation_id: params[:reservation_id]).call
      render json: Tickets::Representers::Single.new(@ticket).basic
    end

    private

    def ticket_params
      params.require(:ticket).permit(:seat, :ticket_type_id)
    end
  end
end
