class User < ActiveRecord::Base
acts_as_authentic

has_many :laptops
has_many :colaborators

attr_accessible :fname, :lname, :password, :password_confirmation, :career, :email, :schoolid, :phone, :cel, :nextel, :admin, :colaborator, :client

validates_presence_of :fname, :lname, :email, :schoolid
validates_uniqueness_of :schoolid, :email
#validates_numericality_of :schoolid, :cel, :phone
validate :there_must_be_a_phone

def self.search(search)
          
          if search
          find(:all, :conditions => ['email LIKE ?', "%#{search}%" ])
        else
          find(:all)
        end
end



protected
  def there_must_be_a_phone
    if (phone.blank? & cel.blank? & nextel.blank?)
      errors.add_to_base("Debe de haber almenos 1 numero de contacto")
    end
  end
  

end
