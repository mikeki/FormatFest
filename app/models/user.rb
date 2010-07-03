class User < ActiveRecord::Base
acts_as_authentic

has_many :laptops
has_many :colaborators

attr_accessible :fname, :lname, :password, :password_confirmation, :career, :email, :schoolid, :phone, :cel, :nextel, :admin, :colaborator, :client

validates_presence_of :fname, :lname, :email, :schoolid
validates_uniqueness_of :schoolid, :email
#validates_numericality_of :schoolid, :cel, :phone
validate :there_must_be_a_phone

CARRERA = [
    # Displayed         stored in db
    [ "IA - Ingeniero Agronomo" , "IA" ],
    [ "IAB - Ingeniero en Agrobiotecnologia" , "IAB" ],
    [ "IIA - Ingeniero en Industrias Alimentarias" , "IIA" ],
    ["ARQ - Arquitecto", "ARQ"],
    ["LEC - Licenciado en Economia", "LEC"],
    ["IC - Ingeniero Civil","IC"],
    ["IBT - Ingeniero en Biotecnologia", "IBT"],
    ["IEC - Ingeniero en Electronica y Comunicaciones", "IEC"],
    ["IFI - Ingeniero Fisico Industrial", "IFI"],
    ["IIS - Ingeniero Industrial y de Sistemas", "IIS"],
    ["IMA - Ingeniero Mecanico Administrador", "IMA"],
    ["IMD - Ingeniero Biomedico", "IMD"],
    ["IME - Ingeniero Mecanico Electricista", "IME"],
    ["IMT - Ingeniero en Mecatronica", "IMT"],
    ["INT - Ingeniero en Negocios y Tecnologias de Informacion", "INT"],
    ["IQA - Ingeniero Quimico Administrador", "IQA"],
    ["IQS - Ingeniero Quimico y de Sistemas", "IQS"],
    ["ISD - Ingeniero en Sistemas Digitales y Robotica", "ISD"],
    ["ITC - Ingeniero en Tecnologias Computacionales", "ITE"],
    ["ITE - Ingeniero en Tecnologias Electronicas", "ITE"],
    ["ITIC - Ingeniero en Tecnologias de Informacion y Comunicaciones", "ITIC"],
    ["ITM - Ingeniero en Telecomunicacion y Microelectronica", "ITM"],
    ["LAD - Licenciado en Animacion y Arte Digital", "LAD"],
    ["LAE - Licenciado en Administracion de Empresas", "LAE"],
    ["LAF - Licenciado en Administracion Financiera", "LAF"],
    ["LAN - Licenciado en Agronegocios  Internacionales", "LAN"],
    ["LAS - Licenciado en Administracion de Sistemas de Salud", "LAS"],
    ["LCC - Licenciado en Ciencias de la Comuniacion", "LCC"],
    ["LCE - Licenciado en Ciencias de la Enfermeria", "LCE"],
    ["LCQ - Licenciado en Ciencias Quimicas", "LCQ"],
    ["LDF - Licenciado en Derecho y Finanzas", "LDF"],
    ["LDI - Licenciado en Diseno Industrial", "LDI"],
    ["LED - Licenciado en Derecho", "LED"],
    ["LEM - Licenciado en Mercadotecnia", "LEM"],
    ["LHS - Licenciado en Humanidades y Ciencias Sociales", "LHS"],
    ["LIN - Licenciado en Negocios Internacionales", "LIN"],
    ["LLE - Licenciado en Lengua y Literatura Hispanicas", "LLE"],
    ["LMI - Licenciado en Periodismo y Medios de Informacion", "LMI"],
    ["LNB - Licenciado en Nutricion y Bienestar Integral", "LNB"],
    ["LPL - Licenciado en Ciencia Politica", "LPL"],
    ["LPO - Licenciado en Psicologia Organizacional", "LPO"],
    ["LRI - Licenciado en Relaciones Internacionales", "LRI"],
    ["LSC - Licenciado en Sistemas de Computacion Administrativa", "LSC"],
    ["LATI - Licenciado en Administracion de Tecnologias de Informacion", "LATI"],
    ["MC - Medico Cirujano", "MC"],
    ["MO - Medico Cirujano Odontologo", "MO"]
    
    
  ]

def self.search(search)
          
          if search
          find(:all, :conditions => ['email LIKE ? OR id = ?', "%#{search}%", "#{search}" ])
        else
          find(:all)
        end
end

protected
  def there_must_be_a_phone
    if (phone.blank? & cel.blank? & nextel.blank?)
      errors.add_to_base("Debe de haber almenos 1 numero de contacto")
    end
  end
  

end
