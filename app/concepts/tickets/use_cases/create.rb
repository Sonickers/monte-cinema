module Tickets
  module UseCases
    class Create
      SeatsNotAvailableError = Class.new(StandardError)
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

      attr_reader :reservation, :tickets

      def available_seats
        seats = Seances::UseCases::GetSeats.new(seance: reservation.seance).call
        seats.available
      end
    end
  end
end
