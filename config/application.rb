require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    I18n.available_locales = [:en, :ja]
    I18n.enforce_available_locales = true
    I18n.default_locale = :ja
    config.generators do |g|
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework false
    end
  end
end
