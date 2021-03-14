class Admin::UsersController < Admin::BaseController
  layout 'admin/dashboard'

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def show
    @user = User.find(params[:id])
    @queixas = @user.queixas
    @queixasNR  = @user.queixas.where.not(situacao_id:1)
    @queixasR  = @user.queixas.where.not(situacao_id:1)
    @queixasNR  = @user.queixas.where.not(situacao_id:1)

  end


def update
#  @user = User.find(params[:id])
@user = User.find(params[:id])
  if @user.update_attributes(user_params)
    flash[:success] = "Perfil atualizado"
     redirect_to admin_users_path
else
  render 'edit'
end
end


def edit
  @user = User.find(params[:id])
end


def user_params
  params.require(:user).permit(:empresa_id)
end

end
