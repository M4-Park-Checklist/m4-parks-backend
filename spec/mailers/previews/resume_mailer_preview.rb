# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class ResumeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resume_mailer/send_email
  def send_email
    ResumeMailer.send_email("fake@domain.com")
  end

end
