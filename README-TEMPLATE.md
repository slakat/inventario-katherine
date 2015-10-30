# Brewhouse Rails Template

This is a Rails 4 application.

## Get up and running

### Dependencies

You'll need:

- Postgresql
- Ruby 2.2+
- bundler (`gem install bundler`)
- Redis (`brew install redis`) - for `sidekiq`
- qt (`brew install qt`) - for `capybara-webkit`

### Bootstrap your dev env

```
bundle
rake db:create db:migrate db:seed
```

## Run the tests

```
RAILS_ENV=test rake db:create db:migrate
rspec && cucumber
```

## Deployment

Circle-CI deploys the master branch when it passes to `brewhouse-rails-template`.


