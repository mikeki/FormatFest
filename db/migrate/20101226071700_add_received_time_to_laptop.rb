class AddReceivedTimeToLaptop < ActiveRecord::Migration
  def self.up
    add_column :laptops, :receivedTime, :timestamp
  end

  def self.down
    remove_column :laptops, :receivedTime
  end
end
