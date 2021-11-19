class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@bdfl.ltd'
  layout 'mailer'
end
