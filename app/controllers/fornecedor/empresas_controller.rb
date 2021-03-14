class Fornecedor::EmpresasController < ApplicationController
layout 'fornecedor/fornecedor'

def index
  @empresas = Empresa.find(current_user.empresa_id)
end


  def show
    @empresa = Empresa.find(params[:id])
    #@queixas = Queixa.where(empresa_id: current_user.empresa_id)
  end

def completar
  @empresa = Empresa.find(current_user.empresa_id)
  @empresa.update_attributes(allowed_params)
  @empresa.assuntos.create(allowed_params)
  redirect_to(empresas_path)
end

   def update
       @empresa = Empresa.find(params[:id])
           if @empresa.update_attributes(allowed_params)
             flash[:success] = "Assunto atualizado"
              redirect_to(fornecedor_empresa_path)
         else
           render 'edit'
         end
         end

def edit
   @empresa = Empresa.find(params[:id])
end




    private
    def allowed_params
      params.require(:empresa).permit(:nome, :responsavel, :avatar, :sobre, :email, :nif, :situacao_id, :atividade_id,
        endereco_attributes: [:nome, :rua, :bairro, :cidade, :numero],
        contacto_attributes: [:tipo, :valor],
        assuntos_attributes: [:nome, :ativo, :empresa_id, :atividade_id])
end

#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
