# Create static statuses
status_names = %w[Booked Confirmed Cancelled]

status_names.each do |name|
  ReservationStatus.create(name: name)
end

# Create default ticket desks
TicketDesk.create(connection: 'Online')
4.times { TicketDesk.create(connection: 'Offline') }

# Create static ticket types
ticket_types = [['Adult', 20], ['Child', 10], ['Senior', 15], ['Student', 12]]

ticket_types.each do |type|
  name, price = type
  TicketType.create(name: name, price: price)
end

blue = Hall.create(name: 'Blue', seats: 200)
green = Hall.create(name: 'Green', seats: 100)
red = Hall.create(name: 'Red', seats: 100)
yellow = Hall.create(name: 'Yellow', seats: 100)
Hall.create(name: 'Purple', seats: 100)
Hall.create(name: 'Teal', seats: 50)
Hall.create(name: 'Pink', seats: 50)
Hall.create(name: 'Lavender', seats: 50)
Hall.create(name: 'Orange', seats: 50)
Hall.create(name: 'Violet', seats: 20)

MovieGenre.create(name: 'Thriller')
MovieGenre.create(name: 'Comedy')
fantasy = MovieGenre.create(name: 'Fantasy')
scifi = MovieGenre.create(name: 'Sci-Fi')
romance = MovieGenre.create(name: 'Romance')
family = MovieGenre.create(name: 'Family')
MovieGenre.create(name: 'Horror')
MovieGenre.create(name: 'Documentary')
action = MovieGenre.create(name: 'Action')

movie1 = Movie.create(title: "Harry Potter and the Philosopher's Stone",
                      length: 159,
                      movie_genre: fantasy,
                      poster_url: 'https://images-na.ssl-images-amazon.com/images/I/713KEd-8jyL._AC_SL1500_.jpg')

movie2 = Movie.create(title: "You've got Mail",
                      length: 120,
                      movie_genre: romance,
                      poster_url: 'https://miro.medium.com/max/520/0*JeA6QiQ6BzuNzKHP.jpg')

movie3 = Movie.create(title: 'Star Wars Episode IV: A New Hope',
                      length: 125,
                      movie_genre: scifi,
                      poster_url: 'https://img01.mgo-images.com/image/thumbnail/v2/content/MMVD85527F13D6BC8CB6518D4B8DF956FAD2.jpeg')

movie4 = Movie.create(title: 'Zootopia',
                      length: 110,
                      movie_genre: family,
                      poster_url: 'https://upload.wikimedia.org/wikipedia/en/9/96/Zootopia_%28movie_poster%29.jpg')

Movie.create(title: 'Pulp Fiction',
             length: 154,
             movie_genre: action,
             poster_url: 'https://en.wikipedia.org/wiki/File:Pulp_Fiction_(1994)_poster.jpg#/media/File:Pulp_Fiction_(1994)_poster.jpg')

Movie.create(title: 'Interstellar',
             length: 169,
             movie_genre: scifi,
             poster_url: 'https://en.wikipedia.org/wiki/Interstellar_(film)#/media/File:Interstellar_film_poster.jpg')

Movie.create(title: 'La La Land',
             length: 128,
             movie_genre: comedy,
             poster_url: 'https://en.wikipedia.org/wiki/File:La_La_Land_(film).png#/media/File:La_La_Land_(film).png')

Movie.create(title: 'Inception',
             length: 148,
             movie_genre: scifi,
             poster_url: 'https://en.wikipedia.org/wiki/File:Inception_(2010)_theatrical_poster.jpg#/media/File:Inception_(2010)_theatrical_poster.jpg')

Movie.create(title: 'Django Unchained',
             length: 165,
             movie_genre: action,
             poster_url: 'https://en.wikipedia.org/wiki/File:Django_Unchained_Poster.jpg#/media/File:Django_Unchained_Poster.jpg')

Movie.create(title: 'How to Train Your Dragon',
             length: 98,
             movie_genre: family,
             poster_url: 'https://en.wikipedia.org/wiki/File:How_to_Train_Your_Dragon_Poster.jpg#/media/File:How_to_Train_Your_Dragon_Poster.jpg')

Movie.create(title: 'Dune',
             length: 156,
             movie_genre: action,
             poster_url: 'https://en.wikipedia.org/wiki/File:Dune_(2021_film).jpg#/media/File:Dune_(2021_film).jpg')

(0..5).each do |number|
  Seance.create(movie: movie1, hall: blue, datetime: "2021-10-01 #{(number * 2) + 10}:00")
  Seance.create(movie: movie2, hall: green, datetime: "2021-10-01 #{(number * 2) + 10}:30")
  Seance.create(movie: movie2, hall: red, datetime: "2021-10-01 #{(number * 2) + 9}:30")
  Seance.create(movie: movie3, hall: yellow, datetime: "2021-10-01 #{(number * 2) + 11}:30")
  Seance.create(movie: movie4, hall: blue, datetime: "2021-10-02 #{(number * 2) + 10}:30")
  Seance.create(movie: movie1, hall: green, datetime: "2021-10-02 #{(number * 2) + 11}:25")
end
