class Admin::SessionsController < ApplicationController
  layout 'sessions'

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
session[:admin_id] = admin.id.to_s
redirect_to admin_index_url, notice: 'Voce está logado'
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

def destroy
session.delete(:admin_id)
redirect_to root_path, notice: 'voce se desconectou'
end

=begin
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
=end
end
