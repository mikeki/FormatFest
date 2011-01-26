class ContactMailer < ActionMailer::Base

  def contact_message(contact)
    recipients 
    from "#{contact.name} <#{contact.email_address}>"
    subject "Mensaje de contacto: #{contact.subject}"
    body['name'] = contact.name
    body['email_address'] = contact.email_address
    body['message'] = contact.message
  end 
  
  def client_message(users, tema, message)
    recipients "#{users}"
    from "FormatFest 18 <contacto@formatfest.com>"
    subject "#{tema}"
    body['message'] = message
  end

end
