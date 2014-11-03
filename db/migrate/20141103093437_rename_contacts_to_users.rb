class RenameContactsToUsers < ActiveRecord::Migration
  def change
    rename_table :contacts, :users
  end
end
