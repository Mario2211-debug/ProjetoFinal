class EmpresasController < ApplicationController

  def index
    # @empresas = Empresa.where(situacao_id:6).order(votos: :desc).paginate(page: params[:page], per_page: 10)
    @empresa = Empresa.all

render json: @empresa
  end

  def show
    @empresa = Empresa.find(params[:id])
    @queixas = @empresa.queixas.order("created_at DESC").limit(3)
    @dia = @empresa.queixas.paginate(page: params[:page], per_page: 10)
    @mes = @empresa.queixas.paginate(page: params[:page], per_page: 10)
    @semana = @empresa.queixas.paginate(page: params[:page], per_page: 10)
  end


  def votar
    @empresa = Empresa.find(params[:id])
    @empresa.votos.create
  end

  def new
    @empresa = Empresa.new
  end


  def create
    @empresa = Empresa.new(allowed_params)
    @empresa.situacao_id = "8"
    if @empresa.save
      @empresa.addempresa = Addempresa.create(empresa_id:@empresa.id, user_id:current_user.id, situacao_id:8)
      redirect_to empresas_path, notice: 'Pedido feito com sucesso!'
    else
      redirect_to empresas_path
    end
  end


def edit
@empresa = Empresa.find(params[:id])
end


  def update
  @empresa = Empresa.find(params[:id])
    if @empresa.update_attributes(allowed_params)
      flash[:success] = "Profile updated"
       redirect_to empresas_path
  else
    render 'edit'
  end
  end



    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:empresa).permit(
        :nome, :responsavel, :email, :nif, :avatar, :atividade_id,
        endereco_attributes: [:nome, :destrito, :rua, :bairro, :cidade, :numero],
        contacto_attributes: [:tipo, :valor],
        perfil_empresarials_attributes: [:user_id, :empresa_id, :situacao_id])
end
#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
