conn_url = {
   url: ENV["REDIS_URL"]
 }

 Sidekiq.configure_server do |config|
   config.redis = conn_url
 end

 Sidekiq.configure_client do |config|
   config.redis = conn_url
 end
