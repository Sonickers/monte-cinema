require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'GET /movies' do
    let(:movie) { create(:movie) }

    before { movie }

    it 'gets list of movies and returns status 200' do
      get '/movies'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /movies/:id' do
    let(:movie) { create(:movie) }

    before { movie }

    it 'gets single movie and returns status 200' do
      get("/movies/#{movie.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /movies' do
    it 'creates a new movie and returns status 201' do
      post('/movies', params: { movie: {
             title: 'Star Wars: Episode IV - A New Hope',
             length: 150,
             movie_genre_id: 1,
             poster_url: 'https://upload.wikimedia.org/wikipedia/en/8/87/StarWarsMoviePoster1977.jpg'
           } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /movies/:id' do
    let(:movie) { create(:movie) }

    before { movie }

    it 'updates a movie and returns status 200' do
      put("/movies/#{movie.id}", params: { movie: { length: 165, movie_genre_id: 2 } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /halls/:id' do
    let(:movie) { create(:movie) }

    before { movie }

    it 'deletes a movie and returns status 204' do
      delete("/movies/#{movie.id}")
      expect(response.status).to eq(204)
    end
  end
end
