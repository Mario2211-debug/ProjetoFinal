class ComparacaosController < ApplicationController

  def show
    @empresa = Empresa.all
    @compare = Comparacao.new
  @comp = Comparacao.find(params[:id])
  end

  def new
    @empresa = Empresa.all
    @compare = Comparacao.new
  end

  def create
    @compare = Comparacao.create(user_id: current_user.id, primeira_id: params[:comparacao][:primeira_id], segunda_id: params[:comparacao][:segunda_id])
      if @compare.save
        redirect_back_or @compare
  end
  end


  def update
  #  @user = User.find(params[:id])
    if @compare.update_attributes(user_params)
      flash[:success] = "Profile updated"
       redirect_to @compare
  end
  end


  def compare_params
    params.require(:compare).permit(:user_id, :primeira_id, :segunda_id)
  end

end
