class AddempresasController < ApplicationController

  def index
    @add_empresa = Addempresa.all
  end

  def new
    @add_empresa = Addempresa.new
  end

  def show
    @add_empresa = Addempresa.find(params[:id])
  end


    def create
      @add_empresa = current_user.addempresas.build(allowed_params)
      @add_empresa.situacao_id = "3"

  #@add_empresa = Addempresa.new(params[:addempresa])
      if @add_empresa.save
        redirect_to root_url, notice: 'Pedido feito com sucesso!'
      else
        redirect_to root_path
      end
    end

      private

      #def allowed_params
      #  params.require(:user).permit!
      #end

      def allowed_params
        params.require(:addempresa).permit(:observacao, :nome, :email, :situacao_id)
  end


  end
