class Admin::SituacaosController < ApplicationController
  layout 'admin/dashboard'

  def index
    @situacaos = Situacao.all
  end

  def show
    @situacao = Situacao.find(params[:id])
  end

  def new
    @situacao = Situacao.new
  end

  def create
    #@add_empresa = current_user.addempresas.build(allowed_params)
@situacao = Situacao.new(params[allowed_params])
#@add_empresa = Empresa.find(params[:id])
    if @situacao.save
      redirect_to admin_assuntos_path, notice: 'Assunto criado!'
    else
      redirect_to admin_assuntos_path
    end
  end
  def edit
  @situacao = Situacao.find(params[:id])
    end

    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
      if @situacao.update_attributes(allowed_params)
        flash[:success] = "Assunto atualizado"
         redirect_back_or  admin_assuntos_path
    else
      render 'edit'
    end
    end

    def destroy
        Situacao.find(params[:id]).destroy
        flash[:success] = "Assunto Apagado"
        redirect_to admin_assuntos_path
      end

    private
    def allowed_params
      params.require(:situacao).permit(:nome, :escopo)

end
  end
