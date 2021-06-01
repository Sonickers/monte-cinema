class TicketsController < ApplicationController
  def index
    @tickets = Tickets::UseCases::FetchAll.new.call
    render json: Tickets::Representers::List.new(@tickets).basic
  end

  def show
    @ticket = Tickets::UseCases::Find.new.call(id: params[:id])
    render json: Tickets::Representers::Single.new(@ticket).basic
  end

  def create
    @ticket = Tickets::UseCases::Create.new.call(params: ticket_params)

    if @ticket.valid?
      render json: @ticket, status: :created, location: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def update
    @ticket = Tickets::UseCases::Update.new.call(id: params[:id], params: ticket_params)

    if @ticket.valid?
      render json: @ticket
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Tickets::UseCases::Delete.new.call(id: params[:id])
  end

  private

  def ticket_params
    params.require(:ticket).permit(:price, :seat, :group, :reservation_id)
  end
end
