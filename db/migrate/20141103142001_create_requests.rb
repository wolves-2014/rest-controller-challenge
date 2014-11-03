class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :requester
      t.belongs_to :requestee
      t.timestamps
    end
  end
end
