# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model
  after_create_commit { NotificationBroadcastJob.perform_later self }

  # Write your custom methods...
end
