module Seances
  module Representers
    class Single
      attr_reader :seance, :seats

      def initialize(seance, seats: Seats.new)
        @seance = seance
        @seats = seats
      end

      def basic
        {
          id: seance.id,
          datetime: seance.datetime,
          movie: seance.movie_id,
          hall: seance.hall_id
        }
      end

      def extended
        basic.merge(seats.to_hash)
      end
    end
  end
end
