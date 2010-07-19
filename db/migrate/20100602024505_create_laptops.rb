class CreateLaptops < ActiveRecord::Migration
  def self.up
    create_table :laptops do |t|
      t.string :marca
      t.string :modelo
      t.string :color
      t.text :defecto
      t.text :comentarios
      t.string :usuario
      t.string :contra
      t.string :estado, :default => "0"
      t.string :paquete
      t.boolean :respaldo
      t.integer :user_id
      t.integer :total

      t.timestamps
    end
  end

  def self.down
    drop_table :laptops
  end
end
