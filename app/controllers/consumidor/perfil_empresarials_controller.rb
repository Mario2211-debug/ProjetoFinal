class Consumidor::PerfilEmpresarialsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  layout 'consumidor/consumidor'

  def index
@perfil = PerfilEmpresarial.all
end

  def show
  @perfil = PerfilEmpresarial.find(params[:id])
end

def acompanhar
  @perfil = PerfilEmpresarial.includes(:user).where(user_id:current_user.id)
end

def new
  @perfil = PerfilEmpresarial.new
end


def create
  @perfil = PerfilEmpresarial.create(allowed_params)
  @perfil.user_id = current_user.id
  @perfil.situacao_id = "5"

  if @perfil.save
    redirect_to consumidor_index_path, notice: 'Pedido feito com sucesso!'
  else
    render 'new'
  end
end

def destroy
    PerfilEmpresarial.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



private
def allowed_params
  params.require(:perfil_empresarial).permit(:empresa_id)
end

end
