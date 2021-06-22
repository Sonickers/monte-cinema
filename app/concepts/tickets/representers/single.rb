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
          price: ticket.ticket_type.price,
          type: ticket.ticket_type.name,
          seat: ticket.seat
        }
      end
    end
  end
end
