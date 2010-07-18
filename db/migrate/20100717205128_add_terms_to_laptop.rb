class AddTermsToLaptop < ActiveRecord::Migration
  def self.up
    add_column :laptops, :terms, :boolean
  end

  def self.down
    remove_column :laptops, :terms
  end
end
