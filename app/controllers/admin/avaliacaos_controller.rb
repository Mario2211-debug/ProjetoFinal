class Admin::AvaliacaosController < ApplicationController
  layout 'admin/dashboard'

    def index
      @avaliacaos = Avaliacao.all
    end

    def new
          @avaliacao = Avaliacao.new
        end

        def show
              @avaliacao = Avaliacao.find(params[:id])
            end



                def edit
                  @avaliacao = Avaliacao.find(params[:id])
                end


    def create
  @avaliacao = Avaliacao.new(avaliacao_params)
  if @avaliacao.save
    flash[:success] = "Welcome to the Sample App!"
    redirect_to   admin_avaliacaos_path

  else
    render 'new'
    end
  end


  def update
  #  @user = User.find(params[:id])
    if @avaliacao.update(avaliacao_params)
      flash[:success] = "Profile updated"
       redirect_to  admin_avaliacaos_path

  else
    render 'edit'
  end


  end

  def destroy
      Avaliacao.find(params[:id]).destroy
      flash[:success] = "User deleted"
      redirect_to admin_avaliacao_path
    end



  private
  def avaliacao_params
    params.require(:avaliacao).permit(:nome)
  end

  end
