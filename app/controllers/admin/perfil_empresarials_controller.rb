class Admin::PerfilEmpresarialsController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  layout 'admin/dashboard'

      def index
        @solicitacoes = Empresa.where.not(situacao:6)
        @aceites = PerfilEmpresarial.where(situacao_id:3)
        @recusados = PerfilEmpresarial.where(situacao_id:4)
        @analise = PerfilEmpresarial.where(situacao_id:5)
      end

def aceites
  @aceites = PerfilEmpresarial.where(situacao_id:3)
end

def analise
  @perfil_empps = PerfilEmpresarial.where(situacao_id:5)
end

def recusadas
  @perfil_empps = PerfilEmpresarial.where(situacao_id:4)
end

def show
  @perfil_empp = PerfilEmpresarial.find(params[:id])
end

def edit
  @perfil_empp = PerfilEmpresarial.find(params[:id])
end

def update
  @perfil_empp = PerfilEmpresarial.find(params[:id])
  if @perfil_empp.update_attributes(allowed_params)
  if  @perfil_empp.situacao_id == 3
    @perfil_empp.user.update_attributes(empresa_id: @perfil_empp.empresa_id, kind:'Fornecedor')
  end
  flash[:success] = "Profile updated"
  redirect_to   admin_perfil_empresarials_path
else
  render 'edit'
end
  end


      def destroy
          PerfilEmpresarial.find(params[:id]).delete
          flash[:success] = "Pedido apagado com sucesso"
          redirect_to admin_perfil_empresarials_path
        end

def aceitar
  @perfil_empp = PerfilEmpresarial.find(params[:id])
  @perfil_empp.update_attributes(situacao_id: 3)

 redirect_to admin_perfil_empresarials_path

end

def recusar
  @perfil_empp = PerfilEmpresarial.find(params[:id])
  @perfil_empp.update_attributes(situacao_id: 4)
 @perfil_empp.user.update_attributes(empresa_id: nil, kind:'Consumidor')
 redirect_to admin_perfil_empresarials_path

end


private
def allowed_params
  params.require(:perfil_empresarial).permit(:situacao_id, :observacao, :empresa_attributes => [:nif])
end

end
