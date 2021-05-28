module Tickets
  module Representers
    class List
      attr_reader :tickets

      def initialize(tickets)
        @tickets = tickets
      end

      def basic
        tickets.map do |ticket|
          {
            id: ticket.id,
            price: ticket.price,
            seat: ticket.seat
          }
        end
      end
    end
  end
end
