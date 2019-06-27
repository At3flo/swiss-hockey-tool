require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SwissHockeyTool
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Raise error on strong params
    config.action_controller.action_on_unpermitted_parameters = :raise

    # Initernalization
    config.i18n.available_locales = [:en, :fr, :de]
    config.i18n.default_locale = :en

    # Devise using email.css via Roadie
    config.to_prepare do
      Devise::Mailer.send(:include, Roadie::Rails::Automatic)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
