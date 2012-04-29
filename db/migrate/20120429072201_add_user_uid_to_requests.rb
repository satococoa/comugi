class AddUserUidToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :user_uid, :string
  end
end
