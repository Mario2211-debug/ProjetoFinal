class Consumidor::QueixasController < ApplicationController
  layout 'consumidor/consumidor'

  def index
    @queixas = Queixa.order("created_at DESC").paginate(page: params[:page], per_page: 10)
      end

  def show
    @queixa = Queixa.find(params[:id])
  end

  def new
    @queixa = Queixa.new
  end

  def create
@queixa = current_user.queixas.build(queixa_params)
#empresa = @queixa.empresa_id
@queixa.ordem.user = @queixa.user
@queixa.ordem.empresa = @queixa.user.empresa_id
    if @queixa.save
redirect_to consumidor_index_path

else
  redirect_to consumidor_index_path
    end
end


=begin
private
def broadcast(empresa)
  empresaTotal = view_context.number_to_currency(empresa.total)
  empresaHTML = ApplicationController.renderer.render(partial: 'home/empresa', locals: { empresa: @empresa })
  empresaChannel.broadcast_to empresa, empresaTotal: empresaTotal, empresaHTML: empresaHTML
end
=end



def novos_negociosS
  @queixa = Queixa.find(params[:id])
  @queixa.update!(novos_negocios:"Sim")
  redirect_to(consumidor_index_path(current_user.id))
end

def novos_negociosN
  @queixa = Queixa.find(params[:id])
  @queixa.update!(novos_negocios:"Não")
  redirect_to(consumidor_index_path(current_user.id))
end

def edit
@queixa = Queixa.find(params[:id])
end


   def update
   #  @user = User.find(params[:id])
 #add_empresa = Addempresa.find_by_id(params[:id])
 @queixa = Queixa.find(params[:id])
     if @queixa.update_attributes(resposta_params)
       flash[:success] = "Respondido"
        redirect_back_or  consumidor_index_path(current_user.id, @queixa.id)
   else
     render 'edit'
   end
   end

private
    def resposta_params
      params.require(:queixa).permit(:mensagem, :situacao_id, :sentimento_id)
    end

 private
 def queixa_params
   params.require(:queixa).permit(:sentimento_id, :avaliacao_id, :empresa_id, :situacao_id, :assunto_id, :titulo, :descricao,
      ordem_attributes: [:numero, :user_id, :empresa_id, :queixa_id,  file: []])
 end




end
