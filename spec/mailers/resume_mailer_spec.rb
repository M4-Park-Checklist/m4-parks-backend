require "rails_helper"

RSpec.describe ResumeMailer, type: :mailer do
  describe "resume_email" do
    let(:mail) { ResumeMailer.send_email("fake@domain.com") }

    it "renders the headers" do
      expect(mail.subject).to eq("Resume email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
