class RemoveAdminFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :admin_id, :bigint
  end
end
