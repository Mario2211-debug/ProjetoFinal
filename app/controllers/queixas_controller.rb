class QueixasController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]


  def index
    # @queixas = Queixa.paginate(page: params[:page], per_page: 4).reverse
    @queixas =  Queixa.all.limit(3).order("created_at DESC")
   end

#  def index
#    @queixa = Queixa.all
#    @assunto =  Assunto.all
#    @sentimento = Sentimento.all
#    current_user = User.all
#  end

def show
  @queixa = Queixa.find(params[:id])
end

def novos_n
    @queixa = Queixa.find(params[:id])
  @queixa.novos_negocios.create
  redirect_to(queixass_path)
end

  def new
    @queixa = Queixa.new
    @assunto =  Assunto.all
    @sentimento = Sentimento.all
  end
=begin
  def novos_negociosS
    @queixa = Queixa.find(params[:id])
    @queixa.update!(novos_negocios:"Sim")
    redirect_to(empresas_path)
  end

  def novos_negociosN
    @queixa = Queixa.find(params[:id])
    @queixa.update!(novos_negocios:"Não")
    redirect_to(empresas_path)
  end
=end
  def create
#@queixa = Queixa.new(queixa_params)
@queixa = current_user.queixas.build(queixa_params)
    #@queixa.build_empresa
    # Saving all stuff
    if @queixa .save
      redirect_to user_path(current_user), notice: 'Agradeço e espero poder ajudar!'
    else
      @feed_items = []
      redirect_to user_path(current_user)
    end
  end

    def edit
       @queixa = Queixa.find(params[:id])
         end


    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
  @queixa = Queixa.find(params[:id])
      if @queixa.update_attributes(update_params)
        flash[:success] = "Assunto atualizado"
         redirect_back_or  user_path(current_user)
    else
      render 'edit'
    end
    end


  private

  def queixa_params
    params.require(:queixa).permit(:sentimento_id, :avaliacao_id, :empresa_id, :situacao_id, :assunto_id, :titulo, :descricao, ordem_attributes: [:file, :numero])
  end

  def update_params
    params.require(:queixa).permit(:sentimento_id, :avaliacao_id, :situacao_id, :mensagem, :novos_negocios)
  end


  #def queixa_params
  #  params.require(:queixa).permit(:sentimento_id, :avaliacao_id, :empresa_id, :situacao_id, :assunto_id, :titulo, :descricao).merge(user_id: current_user.id)
  #end
end
