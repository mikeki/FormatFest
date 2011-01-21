class LaptopMailer < ActionMailer::Base
  
  def registered_message(laptop, email)
    recipients email
    from "FormatFest 18 <contacto@formatfest.com>"
    subject "Confirmacion de registro de laptop #{laptop.marca}"
    body :laptop => laptop
  end
  
  def end_message(laptop, email)
    recipients email
    from "FormatFest 18 <contacto@formatfest.com>"
    subject "Reparacion de laptop #{laptop.marca} finalizada"
    body :laptop => laptop
  end
  
  def clientPost_message(laptop, email)
    recipients email
    from CONTACT_RECIPIENT
    subject "Un cliente del Format Fest ha hecho una pregunta"
    body :laptop => laptop
  end
  
  def answerToClient_message(laptop, email, message)
    recipients email
    from "FormatFest 18 <contacto@formatfest.com>"
    subject "Respuesta a la pregunta de tu laptop #{laptop.marca}"
    body :laptop => laptop, :message => message
  end

end
