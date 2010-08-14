class Laptop < ActiveRecord::Base
attr_accessible :so, :promo, :marca, :modelo, :color, :paquete, :defecto, :comentarios, :usuario, :contra, :estado, :paquete, :respaldo, :total, :user_id, :terms, :other
validates_presence_of :marca, :modelo, :color, :paquete, :so
belongs_to :user
has_many :colaborators, :dependent => :destroy
has_one :program, :dependent => :destroy

MARCA = [

["Acer", "Acer"],
["Apple", "Apple"],
["Asus", "Asus"],
["Dell", "Dell"],
["Fujitsu", "Fujitsu"],
["Gateway", "Gateway"],
["HP - Hewlett-Packard", "HP"],
["IBM", "IBM"],
["Lenovo", "Lenovo"],
["Sony-VAIO","VAIO"],
["Toshiba", "Toshiba"],
["Otra", "Otra"]
]

PAQUETE = [
["Básico", "basico"],
["Personalizado", "personalizado"]
]

SO = [
["Windows 7, 32bits", "Windows 7, 32bits"],
["Windows 7, 64bits", "Windows 7, 64bits"],
["Windows XP, 32bits", "Windows XP, 32bits"],
["Windows XP, 64bits", "Windows XP, 64bits"]
]

HUMANIZED_COLUMNS = {
	:so => "Sistema Operativo"
	}

def self.human_attribute_name(attribute)
	HUMANIZED_COLUMNS[attribute.to_sym] || super
end

end
