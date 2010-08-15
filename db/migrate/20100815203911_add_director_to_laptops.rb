class AddDirectorToLaptops < ActiveRecord::Migration
  def self.up
    add_column :laptops, :director, :boolean, :default => "0"
  end

  def self.down
    remove_column :laptops, :director
  end
end
