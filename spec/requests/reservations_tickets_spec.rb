require 'rails_helper'

RSpec.describe 'ReservationsTickets', type: :request do
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
    let(:ticket) { create(:ticket, reservation_id: reservation.id) }

    before { ticket }

    it 'gets list of tickets and returns status 200' do
      get "/reservations/#{reservation.id}/tickets"
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tickets/:id' do
    let(:ticket) { create(:ticket, reservation_id: reservation.id) }

    before { ticket }

    it 'gets single ticket and returns status 200' do
      get("/reservations/#{reservation.id}/tickets/#{ticket.id}")
      expect(response.status).to eq(200)
    end
  end
end
