module Reservations
  module Representers
    class Single
      attr_reader :reservation

      def initialize(reservation)
        @reservation = reservation
      end

      def basic
        {
          id: reservation.id,
          seance_id: reservation.seance_id,
          status: reservation.reservation_status
        }
      end

      def extended
        basic.merge(tickets: tickets)
      end

      private

      def tickets
        Tickets::Representers::List.new(reservation.tickets).basic
      end
    end
  end
end
