class Admin::SolicitacoesController < ApplicationController
  layout 'admin/dashboard'

    def index
      @solicitacoes = Empresa.where.not(situacao:6)
      @aceites = PerfilEmpresarial.where(situacao_id:3)
      @recusados = PerfilEmpresarial.where(situacao_id:4)
      @analise = PerfilEmpresarial.where(situacao_id:5)
    end
  end
