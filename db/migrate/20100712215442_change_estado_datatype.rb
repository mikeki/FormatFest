class ChangeEstadoDatatype < ActiveRecord::Migration
  def self.up
  	change_column :laptops, :estado, :integer
  end

  def self.down
  end
end
