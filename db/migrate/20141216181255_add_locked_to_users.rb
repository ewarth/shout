class AddLockedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locked, :boolean, :default => false
  end

  def self.down
    remove_column :users, :locked
  end
end
