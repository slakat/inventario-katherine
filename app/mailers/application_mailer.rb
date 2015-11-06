class ApplicationMailer < ActionMailer::Base
  default from: 'Brewhouse Rails Template <support@brewhouse-rails-template.com>'
  layout 'mailer'

  include Roadie::Rails::Automatic
end
