Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['448292333914-g3n662vju4tlssdodi0rfdg2hctr9b40.apps.googleusercontent.com'], ENV['VdhRthm3TIKyA399VWnwnyks']
  end