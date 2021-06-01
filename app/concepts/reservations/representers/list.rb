module Reservations
  module Representers
    class List
      attr_reader :reservations

      def initialize(reservations)
        @reservations = reservations
      end

      def basic
        reservations.map do |reservations|
          Single.new(reservations).basic
        end
      end
    end
  end
end
