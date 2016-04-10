# Previews available at: http://inventario.dev/rails/mailers
# Code is at /test/mailers/previews/devise_preview.rb
class CustomDeviseMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # make sure we use the devise views

  layout 'mailer'

  include Roadie::Rails::Automatic
end
