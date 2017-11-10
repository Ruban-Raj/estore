# Preview all emails at http://localhost:3000/rails/mailers/sent_mails_mailer
class SentMailsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sent_mails_mailer/welcome
  def welcome
    SentMailsMailer.welcome
  end

end
