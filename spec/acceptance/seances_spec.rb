require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Seances' do
  get '/seances' do
    example_request 'Listing seances' do
      expect(status).to eq 200
    end
  end

  get '/seances/:seance_id' do
    parameter :seance_id, 'ID of the seance', required: true

    let(:seance_id) { 1 }

    example_request 'Show seance' do
      expect(status).to eq 200
    end
  end
end
