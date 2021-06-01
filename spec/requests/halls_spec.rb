require 'rails_helper'

RSpec.describe 'Halls', type: :request do
  describe 'GET /halls' do
    let(:hall) { Hall.create(name: 'A', seats: 200) }

    before { hall }

    it 'works and returns status 200' do
      get '/halls'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /halls/:id' do
    let!(:hall) { Hall.create(name: 'A', seats: 200) }

    before { hall }

    it 'works and returns status 200' do
      get("/halls/#{hall.id}")
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /halls' do
    it 'works and returns status 201' do
      post('/halls', params: { hall: { name: 'new name', seats: 100 } })
      expect(response.status).to eq(201)
    end
  end

  describe 'PUT /halls/:id' do
    let(:hall) { Hall.create(name: 'Some name', seats: 200) }

    before { hall }

    it 'works and returns status 200' do
      put("/halls/#{hall.id}", params: { hall: { id: hall.id, name: 'new name' } })
      expect(response.status).to eq(200)
    end
  end

  describe 'DELETE /halls/:id' do
    let(:hall) { Hall.create(name: 'Some name', seats: 500) }

    before { hall }

    it 'works and return status 204' do
      delete("/halls/#{hall.id}")
      expect(response.status).to eq(204)
    end
  end
end
