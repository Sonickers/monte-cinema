require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  let(:user) { create(:user) }
  let(:employee) { create(:user, email: 'employee@example.com', role: 2) }
  let(:auth_headers) { Devise::JWT::TestHelpers.auth_headers({}, user) }
  let(:employee_auth_headers) { Devise::JWT::TestHelpers.auth_headers({}, employee) }
  let(:movie) { create(:movie) }
  let(:hall) { create(:hall) }
  let(:seance) { create(:seance, hall_id: hall.id, movie_id: movie.id) }

  before do
    auth_headers
    employee_auth_headers
    seance
  end

  describe 'GET /reservations' do
    let(:reservation) { create(:reservation, seance_id: seance.id, user_id: user.id) }

    before { reservation }

    it 'gets list of reservations and returns status 200' do
      get '/reservations', headers: auth_headers
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id, user_id: user.id) }

    before { reservation }

    it 'gets single reservation by id and returns status 200' do
      get("/reservations/#{reservation.id}", headers: auth_headers)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /reservations/online' do
    it 'creates new reservation and returns status 201' do
      post('/reservations/online',
           headers: auth_headers,
           params: { seance_id: seance.id, tickets: [{ seat: 'C5', ticket_type_id: 1 }] })
      expect(response.status).to eq(201)
    end

    context 'when seat is taken' do
      let(:reservation) { create(:reservation, seance_id: seance.id) }
      let(:ticket) { create(:ticket, reservation_id: reservation.id) }

      before { ticket }

      it 'fails to create a reservation and returns status 422' do
        post('/reservations/online',
             headers: auth_headers,
             params: { seance_id: seance.id, tickets: [{ seat: ticket.seat, ticket_type_id: 1 }] })
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'POST /reservations/offline' do
    it 'creates new reservation and returns status 201' do
      post('/reservations/offline',
           headers: employee_auth_headers,
           params: {
             seance_id: seance.id,
             reservation_status_id: 2,
             ticket_desk_id: 3,
             tickets: [{ seat: 'F4', ticket_type_id: 2 }]
           })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id) }

    before { reservation }

    it 'returns unauthorized error for regular users' do
      expect do
        put("/reservations/#{reservation.id}", headers: auth_headers,
                                               params: { reservation: { reservation_status_id: 2 } })
      end.to raise_error(Pundit::NotAuthorizedError)
    end

    it 'updates the reservation status when user is an employee' do
      put("/reservations/#{reservation.id}", headers: employee_auth_headers,
                                             params: { reservation: { reservation_status_id: 2 } })

      expect(response.status).to eq(200)
    end

    it 'updates the reservation status when user is an admin' do
      admin = create(:user, email: 'admin@example.com', role: 3)
      admin_auth_headers = Devise::JWT::TestHelpers.auth_headers({}, admin)

      put("/reservations/#{reservation.id}", headers: admin_auth_headers,
                                             params: { reservation: { reservation_status_id: 3 } })

      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /reservations/:id' do
    let(:reservation) { create(:reservation, seance_id: seance.id, user_id: user.id) }

    before { reservation }

    it 'deletes existing reservation and returns status 204' do
      delete("/reservations/#{reservation.id}", headers: auth_headers)
      expect(response.status).to eq(204)
    end
  end
end
