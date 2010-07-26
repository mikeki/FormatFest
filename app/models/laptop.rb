class Laptop < ActiveRecord::Base
attr_accessible :so, :promo
validates_presence_of :marca, :modelo, :color, :paquete
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
["Windows 7", "Windows 7"],
["Windows XP", "Windows xp"]
]


end
