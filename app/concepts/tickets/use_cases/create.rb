module Tickets
  module UseCases
    class Create
      attr_reader :reservation, :tickets

      def initialize(reservation:, tickets:)
        @reservation = reservation
        @tickets = tickets
      end

      def call
        tickets.map do |ticket|
          reservation.tickets.create(ticket)
        end
      end
    end
  end
end
