class Consumidor::SentimentosController < ApplicationController
  layout 'consumidor/consumidor'

  def index
    @sentimentos = Sentimento.all
  end

  def show
    @sentimento = Sentimento.find(params[:id])
  end

  def new
    @sentimento = Sentimento.new
  end

  def create
    #@add_empresa = current_user.addempresas.build(allowed_params)
@sentimento = Sentimento.new(params[allowed_params])
#@add_empresa = Empresa.find(params[:id])
    if @sentimento.save
      redirect_to admin_sentimentos_path, notice: 'Assunto criado!'
    else
      redirect_to admin_sentimentos_path
    end
  end
  def edit
  @sentimento = Sentimento.find(params[:id])
    end

    def update
    #  @user = User.find(params[:id])
  #add_empresa = Addempresa.find_by_id(params[:id])
      if @sentimento.update_attributes(allowed_params)
        flash[:success] = "Assunto atualizado"
         redirect_back_or  admin_sentimentos_path
    else
      render 'edit'
    end
    end

    def destroy
        Sentimento.find(params[:id]).destroy
        flash[:success] = "Assunto Apagado"
        redirect_to admin_sentimentos_path
      end


    private

    #def allowed_params
    #  params.require(:user).permit!
    #end

    def allowed_params
      params.require(:sentimento).permit(:nome)

end
  end
