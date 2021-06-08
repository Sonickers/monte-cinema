require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:movie) { create(:movie) }
  let(:hall) { create(:hall) }
  let(:seance) { create(:seance, hall_id: hall.id, movie_id: movie.id) }

  before do
    movie
    hall
    seance
  end

  describe 'GET /reservations' do
    let(:reservation) { create(:reservation, seance_id: seance.id) }

    before { reservation }

    it 'gets list of reservations and returns status 200' do
      get '/reservations'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id) }

    before { reservation }

    it 'gets single reservation by id and returns status 200' do
      get("/reservations/#{reservation.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations/online' do
    it 'creates new reservation and returns status 201' do
      post('/reservations/online',
           params: { seance_id: seance.id, tickets: [{ seat: 'C5', ticket_type_id: 1 }] })
      expect(response.status).to eq(201)
    end

    context 'when seat is taken' do
      let(:reservation) { create(:reservation, seance_id: seance.id) }
      let(:ticket) { create(:ticket, reservation_id: reservation.id) }

      before { ticket }

      it 'fails to create a reservation and returns status 422' do
        post('/reservations/online',
             params: { seance_id: seance.id, tickets: [{ seat: ticket.seat, ticket_type_id: 1 }] })
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PUT /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id) }

    before { reservation }

    it 'updates seance by id and returns status 200' do
      put("/reservations/#{reservation.id}", params: { reservation: { reservation_status_id: 2 } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id) }

    before { reservation }

    it 'deletes existing reservation and returns status 204' do
      delete("/reservations/#{reservation.id}")
      expect(response.status).to eq(204)
    end
  end
end
