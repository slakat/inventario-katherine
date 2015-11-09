# Brewhouse Rails Template

[![Circle
CI](https://circleci.com/gh/BrewhouseTeam/brewhouse-rails-template.svg?style=svg)](https://circleci.com/gh/BrewhouseTeam/brewhouse-rails-template)
[![Dependency
Status](https://gemnasium.com/BrewhouseTeam/brewhouse-rails-template.svg)](https://gemnasium.com/BrewhouseTeam/brewhouse-rails-template)

This is the base Rails app used at [Brewhouse](http://brewhouse.io).

## Usage

Assuming you want to create "my-rails-app":

1 - Clone this repo:
```
git clone git@github.com:BrewhouseTeam/brewhouse-rails-template.git my-rails-app
```

2 - Bootstrap your app (prepare config files etc...):
```
cd my-rails-app && ./bootstrap my-rails-app
```

## What's in there?

You'll find the gems and configuration niceties that we use on most
rails app we work on.

### The basics

* `devise` with a `User` model setup and mailer previews available at
  `/rails/mailers`
* `simple_form` setup for bootstrap 3
* `virtus` for building services (see `app/services/service.rb`)
* `schema_auto_foreign_keys` for a robust data layer where orphan
  records are not a thing.
* `sidekiq` with dashboard at `/sidekiq`
* `bootstrap-sass` with a couple of defaults in `app/assets/styelsheets/_variables.scss`
* `roadie-rails` to inline css in emails so that GMail picks up the
  styles.

### Dev env

* `dotenv-rails` to store config and secrets in env variables
* `letter_opener` to open emails in the browser in dev env
* `factory_girl`
* `spring1 bin-stubs in `./bin` (ProTip: Add `./bin` to your `$PATH`)

### Test

* `rspec` for unit testing
* `cucumber` with `capybara-webkit` and `capybara-screenshot` for
  integration tests
* `simplecov` because test coverage matters

### Production

* `puma` 'cause it's fast
* `rails_12factor` to run the app on heroku
* `heroku-deflater` to compress assets
* `rollbar` to get notified about errors
* `newrelic_rpm` to monitor performances

