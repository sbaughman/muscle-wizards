require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MuscleWizards
  class Application < Rails::Application
    # Rails.application.config.middleware.use OmniAuth::Builder do
    #   provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    #   :scope => 'email', :display => 'popup'
      #, {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
    end
  end
end
