# app/channels/application_cable/connection.rb
#module ApplicationCable
#  class Connection < ActionCable::Connection::Base
#    identified_by :current_user

#    def connect
#      self.current_user = find_verified_user
#      logger.info("current_user: #{self.current_user.inspect}")
#      logger.add_tags 'ActionCable', self.current_user.email
#    end

#    private
#      def find_verified_user
#       verified_user = User.find_by(cookies.encrypted[:user_id])
#       return reject_unauthorized_connection unless verified_user
#       verified_user
#  end
#end
