require "test_helper"

class InvoiceMailerTest < ActionMailer::TestCase
  test "sendInvoice" do
    mail = InvoiceMailer.sendInvoice
    assert_equal "Sendinvoice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
