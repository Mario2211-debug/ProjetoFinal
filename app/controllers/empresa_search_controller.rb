class EmpresaSearchController < ApplicationController
  layout false

  def index
    @empresas = Empresa.where("nome LIKE ? AND situacao_id LIKE ?", "%#{params[:search]}%", "6")
  end
end
