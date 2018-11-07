require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'devise'

abort("The Rails environment is running in production mode!") if Rails.env.production?

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include FeatureMacros, type: :feature
  config.include Warden::Test::Helpers, type: :feature
  config.include Rails.application.routes.url_helpers, :type => :feature

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller
end

# TestProf.configure do |config|
#   # the directory to put artifacts (reports) in ('tmp/test_prof' by default)
#   config.output_dir = 'tmp/test_prof'
#
#   # use unique filenames for reports (by simply appending current timestamp)
#   config.timestamps = true
#
#   # color output
#   config.color = true
# end
