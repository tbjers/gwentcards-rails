# Load the Rails application.
require File.expand_path('../application', __FILE__)
require File.expand_path('../rollbar', __FILE__)

begin
  # Initialize the Rails application.
  Rails.application.initialize!
rescue StandardError => e
  Rollbar.error(e)
  raise
end
