class SentMailsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sent_mails_mailer.welcome.subject
  #
  def welcome(user)
    if user.image.present?
      attachments[user.image.pic_file_name] = File.read(user.image.pic.path)
    end
    @user = user
    mail(to: user.email,
    subject: "Welcome to Ruban's estore online shopping store")

  end
end
