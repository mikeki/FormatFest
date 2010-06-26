class Laptop < ActiveRecord::Base
belongs_to :user
has_many :colaborators


end
