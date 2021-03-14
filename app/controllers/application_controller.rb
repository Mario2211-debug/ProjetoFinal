class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_admin
  include SessionsHelper

private
  # Confirms a logged-in user.
   def logged_in_user
     unless logged_in? || current_admin?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

   def current_admin
     @current_admin ||= Admin.find_by(id: session[:admin_id])
   end

   def ranking
   @empresa = Empresa.find(params[:id])
   @ranking = @empresa.total
     end

private
def authorize
  redirect_to alogin_path, alert: 'Você deve estar logado paraacessar essa pagina.' if current_admin.nil?
end

end
