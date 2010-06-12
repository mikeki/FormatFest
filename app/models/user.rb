class User < ActiveRecord::Base
acts_as_authentic

has_many :laptops

attr_accessible :fname, :lname, :password, :password_confirmation, :career, :email, :schoolid, :phone, :cel, :nextel, :admin, :colaborator, :client

validates_presence_of :fname, :lname, :email, :schoolid
validates_uniqueness_of :schoolid, :email
validate :there_must_be_a_phone

protected
  def there_must_be_a_phone
    if (phone.blank? & cel.blank? & nextel.blank?)
      errors.add_to_base("Debe de haber almenos 1 numero de contacto")
    end
  end

end
