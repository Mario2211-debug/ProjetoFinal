class AdminController < ApplicationController
  before_action :authorize, only: [:index, :edit, :update, :destroy]
  #before_action :correct_admin
layout 'admin/dashboard'

def index
  @empresas= Empresa.all
  @queixas = Queixa.all
  @users = User.paginate(page: params[:page], per_page: 5)
end

def show
    @admin = Admin.find(params[:id])
end

def update
      #  @user = User.find(params[:id])
   if @admin.update_attributes(admin_params)
      flash[:success] = "PerfilAtualizado"
      redirect_to @admin
   else
    render 'edit'
      end
      end


def edit
    @admin = Admin.find(params[:id])
end



    private
    def admin_params
      params.require(:admin).permit(:nome, :email, :avatar, :password)
    end

end
