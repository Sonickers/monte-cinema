require 'rails_helper'

RSpec.describe "Halls", type: :request do
  describe "GET /" do
    it "should get list of halls" do
      get '/halls'
      expect(response).to have_http_status(200)
    end
  end
end
