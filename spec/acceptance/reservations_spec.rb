require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Reservations' do
  let(:user) { create(:user) }
  let!(:auth_headers) { Devise::JWT::TestHelpers.auth_headers({}, user) }
  let(:movie) { create(:movie) }
  let(:hall) { create(:hall) }
  let(:seance) { create(:seance, hall_id: hall.id, movie_id: movie.id) }
  let!(:reservation) { create(:reservation, seance_id: seance.id, user_id: user.id) }
  let!(:tickets) do
    [
      create(:ticket, seat: 'D3', reservation_id: reservation.id),
      create(:ticket, seat: 'D4', reservation_id: reservation.id),
      create(:ticket, seat: 'D5', reservation_id: reservation.id, ticket_type_id: 3)
    ]
  end

  before do
    header 'Authorization', auth_headers['Authorization']
    header "Content-Type", "application/json"
  end

  get '/reservations' do
    example_request 'Listing reservations' do
      expect(status).to eq 200
    end
  end

  get '/reservations/:reservation_id' do
    parameter :reservation_id, 'ID of the reservation', required: true

    let(:reservation_id) { reservation.id }

    example_request 'Show reservation' do
      expect(status).to eq 200
    end
  end

  post '/reservations/online' do
    parameter :seance_id, 'ID of the seance for the reservation', required: true
    parameter :tickets, 'List of tickets to reserve', required: true

    let(:seance_id) { seance.id }
    let(:tickets) { [{ seat: 'F4', ticket_type_id: 1 }, { seat: 'F5', ticket_type_id: 2 }] }
    let(:raw_post) { params.to_json }

    example_request 'Book reservation online' do
      expect(status).to eq 201
    end
  end
end
