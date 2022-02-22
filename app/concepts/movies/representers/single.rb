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
          title: movie.title,
          genre: movie.movie_genre,
          poster_url: movie.poster_url,
          length: movie.length
        }
      end
    end
  end
end
