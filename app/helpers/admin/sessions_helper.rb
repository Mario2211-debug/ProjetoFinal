module Admin::SessionsHelper
=begin

      def alog_in(admin)
        session[:admin_id] = admin.id
    end


    def current_admin?(admin)
      admin == current_admin
    end

    #def current_user
    #  @current_user ||= User.find_by(id: session[:user_id])
    #end

    # Logs in the given user.

     # Returns the current logged-in user (if any).
     def current_admin
       @current_admin ||= Admin.find_by(id: session[:admin_id])
     end
    # Logs in the given user.
    def alogged_in?
       !current_admin.nil?
     end

     # Logs out the current user.
       def alog_out
         session.delete(:admin_id)
         @current_admin = nil
       end

       # Redirects to stored location (or to the default).
       def redirect_back_or(default)
         redirect_to(session[:forwarding_url] || default)
         session.delete(:forwarding_url)
       end

       # Stores the URL trying to be accessed.
       def astore_location
         session[:forwarding_url] = request.url if request.get?
       end

=end

end
