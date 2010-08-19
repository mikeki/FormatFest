class AddPresidentToLaptops < ActiveRecord::Migration
  def self.up
    add_column :laptops, :president, :boolean, :default=>"0"
  end

  def self.down
    remove_column :laptops, :president
  end
end
