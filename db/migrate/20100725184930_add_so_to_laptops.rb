class AddSoToLaptops < ActiveRecord::Migration
  def self.up
    add_column :laptops, :so, :string
  end

  def self.down
    remove_column :laptops, :so
  end
end
