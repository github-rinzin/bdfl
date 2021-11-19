class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.invite_user.subject
  #
  def invite_user
    mail(to: params[:email], subject: "BDFL portal registration")
  end
end
