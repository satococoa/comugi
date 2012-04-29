class RenameTargetIdToTargetUidInRequests < ActiveRecord::Migration
  def up
    rename_column :requests, :target_id, :target_uid
  end

  def down
    rename_column :requests, :target_uid, :target_id
  end
end
