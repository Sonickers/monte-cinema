module Seances
  module Representers
    class Single
      attr_reader :seance, :seats

      def initialize(seance, seats: {})
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
        basic.merge(seats)
      end
    end
  end
end
