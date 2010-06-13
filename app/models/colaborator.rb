class Colaborator < ActiveRecord::Base
	belongs_to :laptop
	belongs_to :user
end
