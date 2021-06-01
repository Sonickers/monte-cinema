FactoryBot.define do
  factory :movie do
    title { 'Star Wars: Episode IV - A New Hope' }
    length { 150 }
    genre { 'Sci-Fi' }
    poster_url { 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg' }
  end
end
