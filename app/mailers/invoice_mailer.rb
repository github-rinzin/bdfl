class InvoiceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invoice_mailer.sendInvoice.subject
  #
  def sendInvoice
    mail to: params[:email],  subject: "Bhutan Duty Free Limited"
  end
  def deliverProduct
    mail to: params[:email],  subject: "Bhutan Duty Free Limited"
  end
end
