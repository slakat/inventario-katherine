source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '~> 4.2'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3'
gem 'coffee-rails', '~> 4.1'

gem 'jquery-rails'
gem 'turbolinks'

gem 'devise'
gem 'simple_form'
gem 'virtus'
gem 'schema_auto_foreign_keys'
gem 'bootstrap-sass'
gem 'sidekiq', '~> 3.5'
gem 'sinatra' # for sidekiq dashboard
gem 'roadie-rails', '~> 1.0'

gem 'rollbar'
gem 'newrelic_rpm'

gem 'dotenv-rails'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'factory_girl_rails' # `rails g model` generates factories
end

group :test do
  gem 'rspec-rails'
  gem 'rspec-set'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'capybara-screenshot'
  gem 'capybara-webkit'
  gem 'simplecov', require: false
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

