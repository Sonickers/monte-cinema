require 'rails_helper'

RSpec.describe 'Tickets', type: :request do
  let(:movie) { create(:movie) }
  let(:hall) { create(:hall) }
  let(:seance) { create(:seance, hall_id: hall.id, movie_id: movie.id) }
  let(:reservation) { create(:reservation, seance_id: seance.id) }

  before do
    movie
    hall
    seance
    reservation
  end

  describe 'GET /tickets' do
    let(:ticket) { Ticket.create(price: 20, seat: 'F4', group: 'Adult', reservation_id: reservation.id) }

    before { ticket }

    it 'works and returns status 200' do
      get '/tickets'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tickets/:id' do
    let(:ticket) { Ticket.create(price: 20, seat: 'F4', group: 'Adult', reservation_id: reservation.id) }

    before { ticket }

    it 'works and returns status 200' do
      get("/tickets/#{ticket.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /tickets' do
    it 'works and returns status 201' do
      post('/tickets', params: { ticket: { price: 20, seat: 'F4', group: 'Adult', reservation_id: reservation.id } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /tickets/:id' do
    let(:ticket) { Ticket.create(price: 20, seat: 'F4', group: 'Adult', reservation_id: reservation.id) }

    before { ticket }

    it 'works and returns status 200' do
      put("/tickets/#{ticket.id}", params: { ticket: { group: 'Child' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /tickets/:id' do
    let(:ticket) { Ticket.create(price: 20, seat: 'F4', group: 'Adult', reservation_id: reservation.id) }

    before { ticket }

    it 'works and return status 204' do
      delete("/tickets/#{ticket.id}")
      expect(response.status).to eq(204)
    end
  end
end
