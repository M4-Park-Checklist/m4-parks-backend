require "rails_helper"
require "./spec/mailers/previews/resume_mailer_preview.rb"

RSpec.describe ResumeMailer, type: :mailer do
  describe "resume_email" do
    let(:mail) { ResumeMailer.send_email("fake@domain.com") }

    it "renders the headers" do
      expect(mail.subject).to eq("some fire resumes")
      expect(mail.to).to eq(["fake@domain.com"])
      expect(mail.from).to eq(["roosevelt@nationalparks.gov"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to include("If you're looking for a developer, please find links to our resumes below.")
    end
  end
end
