class SearchesController < ApplicationController
  def show
          @busca = Search.find(params[:id])
          total = @busca.search_queixa.joins(:empresa).count
          @resultados = @busca.search_queixa.distinct.select(:empresa_id).map(&:empresa)
      end

      def new
          @busca = Search.new
          @empresa = Empresa.where(situacao_id:6)
          @assunto = Assunto.all
      end

      def create
          @busca = Search.create(search_params)
          redirect_to(@busca)
      end

      def search
        @busca = Search.find(params[:id])
        total = @busca.search_queixa.joins(:empresa).count
        @resultados = @busca.search_queixa.distinct.select(:empresa_id).map(&:empresa)
        #  @resultado = Queixa.search(params[:search])
      end
    #  def search
      #    @resultado = Queixa.search(params[:search])
    #   end

      private

      def search_params
          params.require(:search).permit(:descricao, :titulo, :empresa_nome)
      end


  end
