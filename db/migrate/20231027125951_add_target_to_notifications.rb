class AddTargetToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :target, :integer
  end
end
