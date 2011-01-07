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

end
