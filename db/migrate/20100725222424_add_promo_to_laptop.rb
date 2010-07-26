class AddPromoToLaptop < ActiveRecord::Migration
  def self.up
    add_column :laptops, :promo, :boolean
  end

  def self.down
    remove_column :laptops, :promo
  end
end
