class ContactMailer < ActionMailer::Base

  def contact_message(contact)
    recipients CONTACT_RECIPIENT
    from "#{contact.name} <#{contact.email_address}>"
    subject contact.subject
    body['name'] = contact.name
    body['email_address'] = contact.email_address
    body['message'] = contact.message
  end  

end
