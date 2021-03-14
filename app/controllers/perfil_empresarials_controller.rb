class PerfilEmpresarialsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  def index
    if current_user.empresa_id.nil?
 redirect_to root_url, notice: 'O seu pedido está a ser analisado!'
else
@perfil_empps = PerfilEmpresarial.all
end
end

def acompanhar
end

  def show
  @perfil_empp = PerfilEmpresarial.find(params[:id])
end


def new
  @perfil_empp = PerfilEmpresarial.new
end


def create
#  @perfil_empp = PerfilEmpresarial.new(perfil_params)
  @perfil_empp = current_user.perfil_empresarials.build(allowed_params)
#@add_empresa = Addempresa.new(params[:addempresa])
  if @perfil_empp.save
    redirect_to new_consumidor_perfil_empresarial_, notice: 'Pedido feito com sucesso!'
  else
    render 'new'
  end
end


def update
#  @user = User.find(params[:id])
  if @perfil_empp.update_attributes(allowed_params)
    flash[:success] = "Profile updated"
     redirect_to @user
else
  render 'edit'
end
end


def edit
  @perfil_empp = PerfilEmpresarial.find(params[:id])
end




def destroy
    PerfilEmpresarial.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end



private
def allowed_params
  params.require(:perfil_empresarial).permit(:empresa_id, :situacao_id)

  #.merge(user_id: current_user.id)
#params.require(:empresa).permit(
#  queixa_attributes: [:titulo, :descricao, :assunto_id, :sentimento_id, :user_id],
#  empresa_attributes: [:nome, :responsavel, :email, :sentimento_id, :atividade_id, :nif])
end

end
