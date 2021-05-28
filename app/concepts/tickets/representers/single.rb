module Tickets
  module Representers
    class Single
      attr_reader :ticket

      def initialize(ticket)
        @ticket = ticket
      end

      def basic
        {
          id: ticket.id,
          price: ticket.price,
          seat: ticket.seat
        }
      end
    end
  end
end
