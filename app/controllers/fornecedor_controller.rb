class FornecedorController < ApplicationController
layout 'fornecedor/fornecedor'

def index
  @empresa = Empresa.find(current_user.empresa_id)
  @queixas = Queixa.where(empresa_id: current_user.empresa.id).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  @total = Queixa.where(empresa_id: current_user.empresa.id).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  @resolvidas = Queixa.where(empresa_id: current_user.empresa.id, situacao_id:1).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  @nao_resolvidas =  (Queixa.where(empresa_id: current_user.empresa.id, :situacao_id => 2..8)+Queixa.where(empresa_id: current_user.empresa.id, situacao_id:nil).order("created_at DESC")).paginate(page: params[:page], per_page: 5)
  @NR = Queixa.where.not( empresa_id: current_user.empresa.id, situacao_id:1).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  @R = Queixa.where(empresa_id: current_user.empresa.id, situacao_id:1).order("updated_at DESC").paginate(page: params[:page], per_page: 5)

end


def resolvidas
  current_empresa = current_user.empresa
  @R = current_empresa.queixas.where(situacao_id:1).order("updated_at DESC")
end

def nao_resolvidas
  @NR =  (Queixa.where(empresa_id: current_user.empresa.id, :situacao_id => 2..8)+Queixa.where(empresa_id: current_user.empresa.id, situacao_id:nil).order("created_at DESC")).paginate(page: params[:page], per_page: 5)
end


def ordem
  @queixa = current_user.empresa.queixas
  #@ordem = current_empresa.queixas
end

def reputacao
  current_empresa = current_user.empresas
  @avaliada = current_empresa.queixas.where.not(novos_negocios:nil).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
end

def finalizadas
  current_empresa = current_user.empresa
  @queixas =  current_user.empresa.queixas.where.not(mensagem:nil)
end

def desativadas
  @queixas = current_empresa.queixas.where.not(replica:!nil)
end


def votar
  @empresa = Empresa.find(params[:id])
  @empresa.votos.create
  redirect_to(fornecedor_index_path)
end

    private
def allowed_params
      params.require(:empresa).permit(:nome, :responsavel, :email, :nif, :atividade_id,
        endereco_attributes: [:nome, :rua, :bairro, :cidade, :numero],
        contacto_attributes: [:tipo, :valor],
        addempresa_attributes: [:situacao_id])
end
#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
