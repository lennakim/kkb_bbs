# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

CASClient::Frameworks::Rails::Filter.configure(
  cas_base_url: Settings.cas_base_url,
  service_url: Settings.cas_service_url
  # Pit dad
)