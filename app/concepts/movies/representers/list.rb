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
            genre: movie.movie_genre,
            poster_url: movie.poster_url,
            length: movie.length
          }
        end
      end
    end
  end
end
