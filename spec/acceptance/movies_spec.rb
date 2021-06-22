require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Movies' do
  get '/movies' do
    example_request 'Listing movies' do
      expect(status).to eq 200
    end
  end

  get '/movies/:movie_id' do
    parameter :movie_id, 'ID of the movie', required: true

    let(:movie_id) { 1 }

    example_request 'Show movie' do
      expect(status).to eq 200
    end
  end
end
