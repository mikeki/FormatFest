class Laptop < ActiveRecord::Base
belongs_to :user
has_many :colaborators

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
["Paquete 1 - $180.00", "Paquete 1"],
["Paquete 2 - $200.00", "Paquete 2"]
]

end
