class AddUserContactToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :userContact, :boolean
  end

  def self.down
    remove_column :messages, :userContact
  end
end
