module Tickets
  module UseCases
    class Create
      SeatsNotAvailableError = Class.new(StandardError)
      attr_reader :reservation, :tickets

      def initialize(reservation:, tickets:)
        @reservation = reservation
        @tickets = tickets
      end

      def call
        tickets.map do |ticket|
          raise SeatsNotAvailableError unless available_seats.include? ticket[:seat]

          reservation.tickets.create(ticket)
        end
      end

      private

      def available_seats
        seats = Seances::UseCases::GetSeats.new(seance: reservation.seance).call
        seats.available
      end
    end
  end
end
