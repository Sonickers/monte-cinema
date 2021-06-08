FactoryBot.define do
  factory :movie do
    title { 'Star Wars: Episode IV - A New Hope' }
    length { 150 }
    movie_genre_id { 1 }
    poster_url { 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg' }
  end
end
