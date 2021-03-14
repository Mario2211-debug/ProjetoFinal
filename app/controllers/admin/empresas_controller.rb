class Admin::EmpresasController < Admin::BaseController
  layout 'admin/dashboard'

  def index
    @empresas = Empresa.all.paginate(page: params[:page], per_page: 6)
    @ativas = Empresa.where(situacao:6)
    @inativas = Empresa.where(situacao:7)
    @analise = Empresa.where(situacao:8)
  end


  def recusadas
    @inativas = Empresa.where(situacao:7).paginate(page: params[:page], per_page: 6)
  end

  def analise
    @analise = Empresa.where(situacao:8).paginate(page: params[:page], per_page: 6)
  end

  def show
    @empresa = Empresa.find(params[:id])
  end

  def new
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new(allowed_params)
    @empresa.situacao_id = "3"
    if @empresa.save
      redirect_to admin_empresas_path, notice: 'Pedido feito com sucesso!'
    else
      redirect_to admin_empresas_path
    end
  end


              def edit
                @empresa = Empresa.find(params[:id])
              end


  def update
 @empresa = Empresa.find(params[:id])
    if @empresa.update_attributes(allowed_params)
      flash[:success] = "Profile updated"
       redirect_to admin_empresas_path
  else
    render 'edit'
  end
  end


  def destroy
      Empresa.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to admin_empresas_path
    end



    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:empresa).permit(:situacao_id,
        :nome, :responsavel, :email, :nif, :atividade_id,
          endereco_attributes: [:nome, :rua, :bairro, :cidade, :numero],
          contacto_attributes: [:tipo, :valor])
end
#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
