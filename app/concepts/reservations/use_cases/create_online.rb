module Reservations
  module UseCases
    class CreateOnline
      attr_reader :repository, :params

      def initialize(params:, repository: Reservations::Repository.new)
        @repository = repository
        @params = params
      end

      def call
        repository.create!(reservation_params).tap do |reservation|
          Tickets::UseCases::Create.new(reservation: reservation, tickets: params[:tickets]).call
        end
      end

      private

      def reservation_params
        {
          seance_id: params[:seance_id],
          reservation_status: ReservationStatus.booked,
          ticket_desk: TicketDesk.online
        }
      end
    end
  end
end
