class Admin::AssuntosController < ApplicationController
  layout 'admin/dashboard'

  def index
    @assuntos = Assunto.all
  end

  def show
    @assunto = Assunto.find(params[:id])
  end

  def new
    @assunto = Assunto.new
  end

  def create
    #@add_empresa = current_user.addempresas.build(allowed_params)
@assunto = Assunto.new(params[allowed_params])
#@add_empresa = Empresa.find(params[:id])
    if @assunto.save
      redirect_to admin_assuntos_path, notice: 'Assunto criado!'
    else
      redirect_to admin_assuntos_path
    end
  end



            def edit
              @assunto = Assunto.find(params[:id])
            end

    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
      if @assunto.update_attributes(allowed_params)
        flash[:success] = "Assunto atualizado"
         redirect_back_or  admin_assuntos_path

    else
      render 'edit'
    end

    end




    def destroy
        Assunto.find(params[:id]).destroy
        flash[:success] = "Assunto Apagado"
        redirect_to admin_assuntos_path
      end


    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:assunto).permit(:nome)

end
  end
