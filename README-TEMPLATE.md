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

## Run local environment

Assuming you use [pow](http://pow.cx), your app should live at
http://brewhouse-rails-template.dev.

You should run `sidekiq` to perform background jobs.

## Deployment

Circle-CI deploys the master branch when it passes to https://brewhouse-rails-template.herokuapp.com

The following add-ons should be added to your Heroku app:

```
heroku addons:create papertrail:choklad
heroku addons:create newrelic:wayne
heroku addons:create heroku-redis:hobby-dev
heroku addons:create sendgrid:starter
heroku addons:create rollbar:free
```

The following env variable should be set on your Heroku app:

```
heroku config:add HOST=brewhouse-rails-template.herokuapp.com
heroku config:add PROTOCOL=https
```

