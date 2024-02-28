class ResumeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.resume_email.subject
  #
  def send_email(email)
    mail( 
      to: email,
      subject: "some fire resumes",
      from: "nationalparksserviceservice@gmail.com"
    )
  end
end
