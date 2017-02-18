require 'coveralls'
Coveralls.wear_merged!("rails")

require 'cucumber/rails'
require 'capybara/poltergeist'

ActionController::Base.allow_rescue = false

Warden.test_mode!
World Warden::Test::Helpers
After { Warden.test_reset! }

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 30)
end

Capybara.javascript_driver = :poltergeist
