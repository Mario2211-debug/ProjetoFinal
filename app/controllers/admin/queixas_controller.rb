class Admin::QueixasController < Admin::BaseController
  layout 'admin/dashboard'

  def index
    @queixas = Queixa.paginate(page: params[:page], per_page: 8)
  end
  def show
    @queixa = Queixa.find(params[:id])
  end
end
