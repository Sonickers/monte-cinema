module Movies
  module Representers
    class List
      attr_reader :movies

      def initialize(movies)
        @movies = movies
      end

      def basic
        movies.map do |movie|
          {
            id: movie.id,
            title: movie.title,
            genre: movie.genre,
            poster_url: movie.poster_url
          }
        end
      end
    end
  end
end
