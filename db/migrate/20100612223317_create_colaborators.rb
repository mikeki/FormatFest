class CreateColaborators < ActiveRecord::Migration
  def self.up
    create_table :colaborators do |t|
      t.integer :user_id
      t.integer :laptop_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :colaborators
  end
end
