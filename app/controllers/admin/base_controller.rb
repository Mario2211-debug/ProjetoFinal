class Admin::BaseController < ApplicationController
protected

  def usuarios
User.all
  end

def empresas
Empresa.all
end

    def show
     @user = User.find(params[:id])
     @queixas = find(params[:id])
     users = User.limit(10)

    end

    def new
     @admin = User.new
    end

      def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Bem vindo ao painel de administrador"
      redirect_back_or @admin
    else
      render 'new'
      end
    end


  private
  def admin_params
    params.require(:admin).permit(:nome, :email, :password)
  end

=begin
  # confirma um Admin logado.
  def logged_in_admin
    unless loggeed_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_admin
    @admin = Admin.find(params[:id])
  redirect_to(root_url) unless @admin == current_admin
  end
=end
  end
