class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :encrypted_password
      t.string :carrer
      t.string :email
      t.string :matricula
      t.string :phone
      t.string :cel
      t.string :nextel
      t.boolean :admin
      t.boolean :colaborador
      t.boolean :cliente

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
