class User < ActiveRecord::Base

has_many :laptops

attr_accessible :name, :encrypted_password, :carrer, :email, :matricula, :phone, :cel, :nextel, :admin, :colaborador, :cliente

validates_presence_of :name, :email, :matricula
validates_uniqueness_of :matricula, :email



end
