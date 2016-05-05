# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  :scope => 'email'
end
run Rails.application
