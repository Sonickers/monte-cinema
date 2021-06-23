class RootController < ApplicationController
  def index
    render json: { message: 'Monte Cinema API' }
  end
end
