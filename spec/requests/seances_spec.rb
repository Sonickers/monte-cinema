require 'rails_helper'

RSpec.describe 'Seances', type: :request do
  let(:hall) { create(:hall) }
  let(:movie) { create(:movie) }

  before do
    hall
    movie
  end

  describe 'GET /seances' do
    let(:seance) { Seance.create(date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id) }

    before { seance }

    it 'gets list of seances and returns status 200' do
      get '/seances'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /seances/:id' do
    let(:seance) { Seance.create(date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id) }

    before { seance }

    it 'gets single seance by id and returns status 200' do
      get("/seances/#{seance.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /seances' do
    it 'creates new seance and returns status 201' do
      post('/seances', params: { seance: { date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id } })
      expect(response.status).to eq(201)
    end

    it 'validates movie_id and gives error' do
      post('/seances', params: { seance: { date: '2021-06-01', time: '17:30', hall_id: hall.id } })
      expect(response.status).to eq(422)
    end

    it 'validates hall_id and gives error' do
      post('/seances', params: { seance: { date: '2021-06-01', time: '17:30', movie_id: movie.id } })
      expect(response.status).to eq(422)
    end
  end

  describe 'PUT /seances/:id' do
    let(:seance) { Seance.create(date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id) }

    before { seance }

    it 'updates seance by id and returns status 200' do
      put("/seances/#{seance.id}", params: { seance: { time: '18:00' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /seances/:id' do
    let(:seance) { Seance.create(date: '2021-06-01', time: '17:30', movie_id: movie.id, hall_id: hall.id) }

    before { seance }

    it 'deletes seance by id and return status 204' do
      delete("/seances/#{seance.id}")
      expect(response.status).to eq(204)
    end
  end
end
