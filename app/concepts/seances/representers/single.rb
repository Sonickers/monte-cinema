module Seances
  module Representers
    class Single
      attr_reader :seance

      def initialize(seance)
        @seance = seance
      end

      def basic
        {
          id: seance.id,
          time: seance.time,
          date: seance.date,
          movie: seance.movie_id,
          hall: seance.hall_id
        }
      end

      def extended
        {
          id: seance.id,
          time: seance.time,
          date: seance.date,
          movie: seance.movie_id,
          hall: seance.hall_id,
          available_seats: seance.available_seats,
          taken_seats: seance.taken_seats
        }
      end
    end
  end
end
