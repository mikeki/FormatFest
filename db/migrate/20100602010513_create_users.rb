class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :crypted_password
      t.string :career
      t.string :email
      t.string :schoolid
      t.string :phone
      t.string :cel
      t.string :nextel
      t.boolean :admin, :default => "0"
      t.boolean :colaborator, :default => "0"
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
