class Consumidor::EmpresasController < ApplicationController
  layout 'consumidor/consumidor'

  def index
    @ativas = Empresa.where(situacao:6).paginate(page: params[:page], per_page: 10)
  end

  def show
    @empresa = Empresa.find(params[:id])
  end

    def edit
                @empresa = Empresa.find(params[:id])
    end


  def update
 @empresa = Empresa.find(params[:id])
    if @empresa.update_attributes(allowed_params)
      flash[:success] = "Profile updated"
       redirect_to consumidor_index_path
  else
    render 'edit'
  end
  end


    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:empresa).permit(:situacao_id,
        :nome, :responsavel, :email, :nif, :atividade_id)
end
#def add_params
#  params.require(:empresa).permit(:observacao, :user_id)
#end
  end
