# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SimpleShop::Application.initialize!

ActiveRecord::SessionStore::Session.establish_connection("#{Rails.env}_sessions")