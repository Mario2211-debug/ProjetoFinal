class Fornecedor::QueixasController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
layout 'fornecedor/fornecedor'

 def index
   @queixas = Queixa.where(empresa_id: current_user.empresa_id)

  end
  #@queixas = Queixa.where(empresa_id==current_user.empresa_id)

  def show
     @queixa = Queixa.find(params[:id])
       end

    def edit
          @queixa = Queixa.find(params[:id])
    end


       def update
       #  @user = User.find(params[:id])
     #add_empresa = Addempresa.find_by_id(params[:id])
     @queixa = Queixa.find(params[:id])
         if @queixa.update_attributes(allowed_params)
           flash[:success] = "Respondido"
            redirect_back_or  fornecedor_index_path(current_user.id, @queixa.id)
       else
         render 'edit'
       end
       end

  private

  def allowed_params
    params.require(:queixa).permit(:replica)
  end
  #def queixa_params
  #  params.require(:queixa).permit(:sentimento_id, :avaliacao_id, :empresa_id, :situacao_id, :assunto_id, :titulo, :descricao).merge(user_id: current_user.id)
  #end
end
