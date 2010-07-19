class Laptop < ActiveRecord::Base
validates_presence_of :marca, :modelo, :color, :paquete, :respaldo
belongs_to :user
has_many :colaborators, :dependent => :destroy
has_one :program, :dependent => :destroy

MARCA = [
["HP - Hewlett-Packard", "HP"],
["Dell", "Dell"],
["Toshiba", "Toshiba"],
["IBM", "IBM"],
["Acer", "Acer"],
["Asus", "Asus"],
["Fujitsu", "Fujitsu"],
["Gateway", "Gateway"],
["Lenovo", "Lenovo"],
["Sony-VAIO","VAIO"],
["Otra", "Otra"]
]

PAQUETE = [
["Básico", "basico"],
["Personalizado", "personalizado"]
]


end
