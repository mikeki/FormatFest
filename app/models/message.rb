class Message < ActiveRecord::Base
  validates_presence_of :post
  
  belongs_to :laptop
  belongs_to :user
  
  attr_accessible :post, :userContact
  
end
