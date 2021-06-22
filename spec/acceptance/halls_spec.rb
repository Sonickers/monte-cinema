require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Halls' do
  get '/halls' do
    example_request 'Listing halls' do
      expect(status).to eq 200
    end
  end

  get '/halls/:hall_id' do
    parameter :hall_id, 'ID of the hall', required: true

    let(:hall_id) { 1 }

    example_request 'Show hall' do
      expect(status).to eq 200
    end
  end
end
