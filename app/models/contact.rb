# ...\models\contact.rb
class Contact < Tableless
  column :name,          :string
  column :email_address, :string
  column :subject,       :string
  column :message,       :text
  validates_presence_of  :name, :email_address, :subject, :message
  validates_format_of    :email_address,
                         :with => %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z}i,
                         :message => "debe de parecer una direccion de email"

HUMANIZED_COLUMNS = {
	:message => "Mensaje",
	:subject => "Asunto"
	}

def self.human_attribute_name(attribute)
	HUMANIZED_COLUMNS[attribute.to_sym] || super
end

end #class
