require 'factory_bot'

RSpec.configure do |config|
  FactoryBot.find_definitions
  config.include FactoryBot::Syntax::Methods
end
