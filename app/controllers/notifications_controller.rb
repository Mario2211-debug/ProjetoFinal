  class NotificationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_notifications

    def index
      @Notifi = Notification.all.reverse
    end

    def mark_as_read
        if params[:id]
          @notification = Notification.find(params[:id])
          @notification.update_attribute(:read_at, Time.zone.now)
        else
          @notifications.update_all(:read_at, Time.zone.now)
        end

        respond_to do |format|
          format.json { render json: { success: true } }
        end
      end

    private
    def set_notifications
      @notifications = Notification.where(recipient: current_user).unread
    end

    private
    def authenticate_user!
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
