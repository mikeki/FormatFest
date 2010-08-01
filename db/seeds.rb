# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create!(
  :fname => "Format",
  :lname => "Fest",
  :password => "secret",
  :password_confirmation => "secret",
  :career => "ITC",
  :email => "formatfest@saitc-mty.com",
  :admin => "1",
  :schoolid => "111111",
  :cel => "1234567"
)
