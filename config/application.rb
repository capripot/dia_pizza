require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheCommit
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # load settings
    Figleaf::Settings.configure_with_auto_define do |s|
      s.env = if Rails.env.test?
        Rails.env
      else
        ENV.fetch("LOGICAL_ENV", Rails.env)
      end

      s.load_settings
    end

    if Figleaf::Settings.respond_to? :asset_host
      config.action_controller.asset_host = Figleaf::Settings.asset_host.host unless ENV["CIRCLECI"]
    end

    config.time_zone = "Eastern Time (US & Canada)"
  end
end
