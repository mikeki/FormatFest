class AddOtherToLaptops < ActiveRecord::Migration
  def self.up
    add_column :laptops, :other, :string
  end

  def self.down
    remove_column :laptops, :other
  end
end
