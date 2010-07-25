class UserMailer < ActionMailer::Base

  def registration_confirmation(user)
    recipients  "mail@mail.com"
    subject     "Thank you for Registering"
    body        :user => user
  end  

end
