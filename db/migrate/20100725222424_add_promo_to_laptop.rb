class AddPromoToLaptop < ActiveRecord::Migration
  def self.up
    add_column :laptops, :promo, :boolean, :default => 0
  end

  def self.down
    remove_column :laptops, :promo
  end
end
