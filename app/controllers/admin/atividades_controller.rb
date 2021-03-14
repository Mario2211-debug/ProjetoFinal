class Admin::AtividadesController < ApplicationController
  layout 'admin/dashboard'

  def index
    @atividades = Atividade.paginate(page: params[:page], per_page:6)

  end

  def show
    @atividade = Atividade.find(params[:id])
  end

  def new
    @atividade = Atividade.new
  end

  def create
    #@add_empresa = current_user.addempresas.build(allowed_params)
@atividade = Atividade.new(params[allowed_params])
#@add_empresa = Empresa.find(params[:id])
    if @atividade.save
      redirect_to admin_atividades_path, notice: 'Assunto criado!'
    else
      redirect_to admin_assuntos_path
    end
  end
  def edit
  @atividade = Atividade.find(params[:id])
    end

    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
      if @atividade.update_attributes(allowed_params)
        flash[:success] = "Assunto atualizado"
         redirect_back_or  admin_assuntos_path
    else
      render 'edit'
    end
    end

    def destroy
        Atividade.find(params[:id]).destroy
        flash[:success] = "Assunto Apagado"
        redirect_to admin_assuntos_path
      end

    private
    def allowed_params
      params.require(:atividade).permit(:nome)

end
  end
