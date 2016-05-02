source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 4.2'
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
gem 'sidekiq', '~> 4.0'
gem 'sinatra' # for sidekiq dashboard
gem 'roadie-rails', '~> 1.0'

gem 'rollbar'
gem 'newrelic_rpm'

gem 'dotenv-rails'

gem 'haml-rails'

gem 'jquery-datatables-rails', '~> 3.3.0'
gem "select2-rails"


group :development do
  gem 'letter_opener'
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'byebug'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'factory_girl_rails' # `rails g model` generates factories
  gem 'mysql2'
end

group :production do
  gem 'puma'
  gem 'rails_12factor'
  gem 'heroku-deflater'
  gem 'pg'
end

