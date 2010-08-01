class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.boolean :chrome
      t.boolean :firefox
      t.boolean :messenger
      t.boolean :skype
      t.boolean :itunes
      t.boolean :reader
      t.boolean :office, :default => "1"
      t.boolean :flash, :default => "1"
      t.boolean :avast, :default => "1"
      t.boolean :winrar
      t.boolean :java, :default => "1"
      t.integer :laptop_id
      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
