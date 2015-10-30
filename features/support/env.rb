require 'simplecov'
SimpleCov.start

require 'cucumber/rails'

require 'capybara-screenshot/cucumber'

require 'sidekiq/testing'
Sidekiq::Testing.inline!

# Capybara defaults to CSS3 selectors rather than XPath.
# Capybara.default_selector = :xpath

# By default, any exception happening in your Rails application will bubble up
# to Cucumber so that your scenario will fail.
# To allow Rails to rescue exceptions Tag your scenario (or feature) with @allow-rescue
ActionController::Base.allow_rescue = false

# Remove/comment out the lines below if your app doesn't have a database.
# For some databases (like MongoDB and CouchDB) you may need to use :truncation instead.
begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before('@javascript') do
  DatabaseCleaner.strategy = :truncation
end

Before('~@javascript') do
  DatabaseCleaner.strategy = :transaction
end

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

Capybara.javascript_driver = :webkit

Capybara::Webkit.configure do |config|
  config.block_unknown_urls
end
