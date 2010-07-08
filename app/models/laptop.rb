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
["Sony-VAIO","VAIO"]
]


end
