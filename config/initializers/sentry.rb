Sentry.init do |config|
  config.dsn = 'https://39ba3df194d04d50bac838121459e870@o877093.ingest.sentry.io/5827390'
  config.enabled_environments = %w[production]
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |_context|
    true
  end
end
