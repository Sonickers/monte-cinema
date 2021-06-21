class CustomFailure < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'json'
    self.response_body = { status: 401, error: 'Unauthorized' }.to_json
  end
end
