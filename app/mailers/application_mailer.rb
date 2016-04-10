class ApplicationMailer < ActionMailer::Base
  default from: 'Inventario <support@inventario.com>'
  layout 'mailer'

  include Roadie::Rails::Automatic
end
