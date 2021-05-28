require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    let(:movie) do
      Movie.create(
        title: 'Star Wars: Episode IV - A New Hope',
        length: 150,
        genre: 'Sci-Fi',
        poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
      )
    end

    before { movie }

    it 'works and returns status 200' do
      get '/movies'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies/:id' do
    let(:movie) do
      Movie.create(
        title: 'Star Wars: Episode IV - A New Hope',
        length: 150,
        genre: 'Sci-Fi',
        poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
      )
    end

    before { movie }

    it 'works and returns status 200' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /movies' do
    it 'works and returns status 201' do
      post('/movies', params: { movie: {
             title: 'Star Wars: Episode IV - A New Hope',
             length: 150,
             genre: 'Sci-Fi',
             poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
           } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /movies/:id' do
    let(:movie) do
      Movie.create(
        title: 'Star Wars: Episode IV - A New Hope',
        length: 150,
        genre: 'Sci-Fi',
        poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
      )
    end

    before { movie }

    it 'works and returns status 200' do
      put("/movies/#{movie.id}", params: { movie: { length: 165 } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /halls/:id' do
    let(:movie) do
      Movie.create(
        title: 'Star Wars: Episode IV - A New Hope',
        length: 150,
        genre: 'Sci-Fi',
        poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
      )
    end

    before { movie }

    it 'works and returns status 204' do
      delete("/movies/#{movie.id}")
      expect(response.status).to eq(204)
    end
  end
end
