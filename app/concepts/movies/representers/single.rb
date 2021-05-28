module Movies
  module Representers
    class Single
      attr_reader :movie

      def initialize(movie)
        @movie = movie
      end

      def basic
        {
          id: movie.id,
          title: movie.title
        }
      end
    end
  end
end
