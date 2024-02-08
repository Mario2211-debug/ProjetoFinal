class Consumidor::AddempresasController < ApplicationController
  layout 'consumidor/consumidor'

  def index
    @add_empresas = Addempresa.all
  end

  def show
    @add_empresa = Addempresa.find(params[:id])
  end

  def new
    @add_empresa = Addempresa.new
  end

  def create
    #@add_empresa = current_user.addempresas.build(allowed_params)
@add_empresa = Addempresa.new(allowed_params)
@add_empresa.user_id = current_user.id
@add_empresa.situacao_id = "3"
#@add_empresa = Empresa.find(params[:id])
    if @add_empresa.save
      redirect_to root_url, notice: 'Pedido feito com sucesso!'
    else
      redirect_to root_path
    end
  end

            def edit
              @add_empresa = Addempresa.find(params[:id])
            end

    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
  @add_empresa = Addempresa.find(params[:id])
  @add_empresa.admin_id = current_admin.id
      if @add_empresa.update_attributes(allowed_params)
        flash[:success] = "Profile updated"
         redirect_back_or  admin_addempresas_path

    else
      render 'edit'
    end

    end




    def destroy
        Addempresa.find(params[:id]).destroy
        flash[:success] = "Pedido Apagado"
        redirect_to admin_addempresa_path
      end


    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:addempresa).permit(:nome, :observacao, :situacao_id, :empresa_id, :admin_id)

end
  end
