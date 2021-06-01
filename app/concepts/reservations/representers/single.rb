module Reservations
  module Representers
    class Single
      attr_reader :reservations

      def initialize(reservations)
        @reservations = reservations
      end

      def basic
        {
          id: reservations.id
        }
      end
    end
  end
end
