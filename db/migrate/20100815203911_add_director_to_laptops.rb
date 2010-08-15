class AddDirectorToLaptops < ActiveRecord::Migration
  def self.up
    add_column :laptops, :director, :boolean
  end

  def self.down
    remove_column :laptops, :director
  end
end
