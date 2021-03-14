class Consumidor::PedidosController < ApplicationController
  #before_action :logged_in_user, only: [:create, :destroy]
  layout 'consumidor/consumidor'

  def pedidos
@perfil = PerfilEmpresarial.find(params[:id])
@empresa = Empresa.find(params[:id])

end

end
