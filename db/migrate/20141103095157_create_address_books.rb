class CreateAddressBooks < ActiveRecord::Migration
  def change
    create_table :address_books do |t|
      t.belongs_to  :user
      t.belongs_to  :contact

      t.timestamps
    end
  end
end
