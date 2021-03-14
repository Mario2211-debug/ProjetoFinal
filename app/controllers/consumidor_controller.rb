class ConsumidorController < ApplicationController
layout 'consumidor/consumidor'

def index

  sql = "SELECT * FROM queixas WHERE queixas.user_id = '#{current_user.id}' ORDER BY created_at DESC "
  @queixas = Queixa.paginate_by_sql(sql, :page => params[:page], :per_page => 5)
  @empresas= Empresa.where(situacao_id:3)
  #@queixas = Queixa.where(user_id: current_user.id).order("created_at DESC").paginate(page: params[:page], per_page: 5)
  @consumidor = current_user
  @empresa = current_user.perfil_empresarial

end

def respondidas
  @resolvida = current_user.queixas.where(situacao_id:1).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
  @nao_resolvida = current_user.queixas.where.not(replica:nil).where(situacao_id:nil).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
end

def nao_respondidas
  @resolvida = current_user.queixas.where(replica:nil, situacao_id:1).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
  @nao_resolvida = current_user.queixas.where(replica:nil, situacao_id:nil ).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
end

def acompanhar
end


def pedidos
  @perfil = current_user.perfil_empresarial
  @empresarial = current_user.addempresas
end

def apagar
      Queixa.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to consumidor_index_path
end

def avaliadas
  @avaliada = current_user.queixas.where(situacao_id:1).order("updated_at DESC").paginate(page: params[:page], per_page: 5)
end


def desativadas
  @queixas = current_user.queixas.where.not(replica:!nil)
end



  end


=begin
    # confirma um Admin logado.
    def logged_in_admin
      unless alogged_in?
        astore_location
        flash[:danger] = "Please log in."
        redirect_to admin_adminlogin_url
      end
    end

    def correct_admin
      @admin = Admin.find(params[:id])
    redirect_to(admin_index_url)
    unless @admin == current_admin
    end

    end
=end
