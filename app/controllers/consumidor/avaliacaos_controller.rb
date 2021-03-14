class Consumidor::AvaliacaosController < ApplicationController
  before_action :set_queixa

  def create
      @avaliacao = @avaliacao.avaliacao.new :value => params[:value]
      if @avaliacao.save
        redirect_to :back, :notice => "Rating successful."
      else
        redirect_to  :back, :notice => "Something went wrong."
      end
    end

    def update
    @avaliacao = Avaliacao.find(params[:id])
    @avaliacao.update_attribute :valor, params[:valor]
  end

  private
    def set_article
      @avaliacao = Avaliacao.find(parms[:queixa_id])
    end
end
