require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FitnessAppChallenge
  class Application < Rails::Application
    Rails.application.config.active_storage.variant_processor = :mini_magick

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.time_zone = 'Asia/Kolkata'


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
