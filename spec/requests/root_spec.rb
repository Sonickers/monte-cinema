require 'rails_helper'

RSpec.describe 'Root', type: :request do
  describe 'GET /' do
    it 'works and returns status 200' do
      get '/'
      expect(response).to have_http_status(200)
      expect(response.body).to eq({ message: 'Monte Cinema API' }.to_json)
    end
  end
end
