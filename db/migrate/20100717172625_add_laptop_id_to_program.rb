class AddLaptopIdToProgram < ActiveRecord::Migration
  def self.up
    add_column :programs, :laptop_id, :integer
  end

  def self.down
    remove_column :programs, :laptop_id
  end
end
