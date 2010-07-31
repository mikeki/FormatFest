class LaptopMailer < ActionMailer::Base
  
  def received_message(laptop, email)
    recipients email
    from "FormatFest 17 <formatfest@saitc-mty.com>"
    subject "Confirmacion de recepcion de laptop #{laptop.marca} #{laptop.modelo}"
    body :laptop => laptop
  end  
  
  def end_message(laptop, email)
    recipients email
    from "FormatFest 17 <formatfest@saitc-mty.com>"
    subject "Reparacion de laptop #{laptop.marca} #{laptop.modelo} finalizada"
    body :laptop => laptop
  end

end
