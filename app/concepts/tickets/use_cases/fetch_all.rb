module Tickets
  module UseCases
    class FetchAll
      attr_reader :reservation_id

      def initialize(reservation_id:)
        @reservation_id = reservation_id
      end

      def call
        reservation = Reservations::UseCases::Find.new(id: reservation_id).call
        reservation.tickets
      end
    end
  end
end
