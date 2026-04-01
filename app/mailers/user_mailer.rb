class UserMailer < ApplicationMailer
  default from: "notifications@example.com"
  layout "mailer"

  def welcome_email(user)
    @user = user
    attachments["welcome_guide.pdf"] = File.read("/home/ubuntu/Downloads/WORKSHOP_RAILS.pdf")
    mail(
      to: @user.email,
      subject: "Welcome to our App, Milan!",
      reply_to: "support@example.com"
    )
  end
end
