class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  #before_action :custom_user, only: [:index, :edit, :update, :destroy]


  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @queixas = @user.queixas.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
@user = User.new(allowed_params)
if @user.save
  log_in user_path(current_user)
  flash[:success] = "Welcome to the Sample App!"
  redirect_back_or user_path(current_user)
else
  render 'new'
  end
end


def update
  #@user = User.find(params[:id])
  if @user.update(allowed_params)
    flash[:success] = "Perfil atualizado"
     redirect_to consumidor_index_path(current_user)
else
  render 'edit'
end
end


def edit
  @user = User.find(params[:id])
end



def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuário removido"
    redirect_to users_url
  end



    def pedido_de_perfil
  if @user.update_attributes(perfilempresa_params)
    flash[:success] = "Aguarde enquanto nós analisamos o pedido"
    redirect_back_or @user
  else
    render 'new'
    end
  end


private
def allowed_params
  params.require(:user).permit(:nome, :email, :B_I, :avatar, :password, :password_confirmation,
     endereco_attributes: [:nome, :rua, :bairro, :cidade, :destrito, :numero],
     contacto_attributes: [:tipo, :valor],
     perfil_empresarial_attributes: [:empresa_id, :situacao_id])
end

=begin
def custom_user
     redirect_to(root_url) unless current_user.empresas?
   end
=end
# Before filters

   # Confirms a logged-in user.
   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

   def correct_user
     @user = User.find(params[:id])
 redirect_to(root_url) unless @user == current_user
end
end
