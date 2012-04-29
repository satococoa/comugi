class RemoveUserIdFromLoves < ActiveRecord::Migration
  def up
    remove_column :loves, :user_id
      end

  def down
    add_column :loves, :user_id, :integer
  end
end
