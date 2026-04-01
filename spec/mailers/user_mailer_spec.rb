require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "User mailer validation" do
    let(:user) { User.create!(name: "Milankumar Jaysukhbhai Thesiya", email: "milan@gmail.com", age: 23) }
    let(:mail) { UserMailer.welcome_email(user) }
    it "Mail components validation" do
      expect(mail.subject).to eq("Welcome to our App, Milan!")
      expect(mail.to).to eq([ user.email ])
      expect(mail.from).to eq([ "notifications@example.com" ])
      expect(mail.reply_to).to eq([ "support@example.com" ])
      expect(mail.multipart?).to be(true)
      puts mail.body.encoded
      expect(mail.html_part.body.decoded).to include("Hello Milan")
      expect(mail.html_part.body.decoded).to include("Thank you for joining.")
      expect(mail.attachments.count).to eq(1)
      attachment = mail.attachments.first
      expect(attachment.filename).to eq("welcome_guide.pdf")
      expect(attachment.content_type).to start_with("application/pdf")
    end
    it "successfully sends the email (Deliveries)" do
      ActionMailer::Base.deliveries.clear
      expect {
        mail.deliver_now
      }.to change(ActionMailer::Base.deliveries, :count).by(1)
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email.subject).to eq("Welcome to our App, Milan!")
    end
  end
end
