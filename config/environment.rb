# Be sure to restart your server when you modify this file
$KCODE = 'u'

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.0.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

# LoginEngine�ׂ̈̒ǉ�
require File.join(RAILS_ROOT, "vendor", "plugins", "engines", "lib", "engines", "deprecated_config_support")
require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')


Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use (only works if using vendor/rails).
  # To use Rails without a database, you must remove the Active Record framework
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  
  # LoginEngine�ׂ̈̒ǉ�
  config.plugins = [ :engines, :all ]

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_tastymap_session',
    :secret      => '5b2631a801b4fde22f9d6f6b9516ed1d1fbf720f9fc4b7bb0012deac3e98be1463348b54a974893be72c1062d20b781ce2064a6b582f95412899de44545b45d8'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with 'rake db:sessions:create')
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector

  # Make Active Record use UTC-base instead of local time
  # config.active_record.default_timezone = :utc
end

ActiveRecord::Errors.default_error_messages = {
  :inclusion => "activerecord_error_inclusion",
  :exclusion => "activerecord_error_exclusion",
  :invalid => "activerecord_error_invalid",
  :confirmation => "activerecord_error_confirmation",
  :accepted  => "activerecord_error_accepted",
  :empty => "activerecord_error_empty",
  :blank => "activerecord_error_blank",
  :too_long => "activerecord_error_too_long",
  :too_short => "activerecord_error_too_short",
  :wrong_length => "activerecord_error_wrong_length",
  :taken => "activerecord_error_taken",
  :not_a_number => "activerecord_error_not_a_number"
}
ActionView::Base.field_error_proc = Proc.new{ |html_tag, instance| "#{html_tag}" }

GLoc.set_config :default_language => :ja
GLoc.clear_strings
GLoc.clear_strings_except :en, :ja
GLoc.set_kcode
GLoc.load_localized_strings
GLoc.set_config(:raise_string_not_found_errors => false)
    
module LoginEngine
	config :salt, "my-salt"
	config :changeable_fields, [ 'firstname', 'lastname', 'screenname', 'description', 'email' ]
	config :use_email_notification, false
#	config :admin_email, "izuno@answer.co.jp"
	config :user_table, "accounts"
end