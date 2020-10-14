require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BarcodeApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.serve_static_files = false
    config.after_initialize do
      ShoppingCache.delete_all if ActiveRecord::Base.connection.table_exists? 'shopping_caches'
      File.delete("#{Rails.root}/tmp/print_devices/lcd") if File.exist?("#{Rails.root}/tmp/print_devices/lcd")
      File.delete("#{Rails.root}/tmp/print_devices/printer") if File.exist?("#{Rails.root}/tmp/print_devices/printer")
    end
    config.print_devices_path = "#{Rails.root}/tmp/print_devices/"
  end
end
