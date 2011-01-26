class Laptop < ActiveRecord::Base
attr_accessible :receivedTime, :so, :promo, :marca, :modelo, :color, :paquete, :president, :defecto, :director
attr_accessible :comentarios, :usuario, :contra, :estado, :paquete, :respaldo, :total, :user_id
attr_accessible :terms, :other
validates_presence_of :marca, :modelo, :color, :paquete, :so
belongs_to :user
has_many :colaborators, :dependent => :destroy
has_one :program, :dependent => :destroy
has_many :messages, :dependent => :destroy

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
["Windows XP, 32bits", "Windows XP, 32bits"]
]

ESTADO = [
["Todas", "-1"],
["Registradas", "0"],
["Recibidas", "1"],
["Empezadas", "2"],
["Terminadas", "3"],
["Entregadas", "4"]
]

HUMANIZED_COLUMNS = {
	:so => "Sistema Operativo"
	}

def self.human_attribute_name(attribute)
	HUMANIZED_COLUMNS[attribute.to_sym] || super
end

end
