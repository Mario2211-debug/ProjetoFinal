class Fornecedor::AssuntosController < ApplicationController
layout 'fornecedor/fornecedor'

def index
  @assuntos = Assunto.where(empresa_id:current_user.empresa_id)
end


  def show
    @assunto = Assunto.find(params[:id])
    #@queixas = Queixa.where(empresa_id: current_user.empresa_id)
  end

  def edit
  @assunto = Assunto.find(params[:id])
  end



  def new
    @assunto = Assunto.new
  end


  def create
  #  @perfil_empp = PerfilEmpresarial.new(perfil_params)
    @assunto = Assunto.new(allowed_params)
    @assunto.atividade_id = current_user.empresa.atividade_id
    @assunto.empresa_id = current_user.empresa_id

  #@add_empresa = Addempresa.new(params[:addempresa])
    if @assunto.save
      redirect_to fornecedor_assuntos_path, notice: 'Serviço criado com sucesso!'
    else
      render 'new'
    end
  end

   def update
         #  @user = User.find(params[:id])
       #add_empresa = Addempresa.find_by_id(params[:id])
       @assunto = Assunto.find(params[:id])
           if @assunto.update_attributes(allowed_params)
             flash[:success] = "Assunto atualizado"
              redirect_back_or  fornecedor_empresa_path(current_user, current_user.empresa_id)
         else
           render 'edit'
         end
         end



    private
    def allowed_params
      params.require(:assunto).permit(:nome, :ativo, :empresa_id, :atividades_id)
end

#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
