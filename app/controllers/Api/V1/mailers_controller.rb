class Api::V1::MailersController < ApplicationController
  def send_email
    puts "Sending email..."
    email = params[:email]
    ResumeMailer.send_email(email).deliver_later
  end
end
