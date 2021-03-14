class HomeController < ApplicationController
layout 'home/home'
    def home
if logged_in?
  @feed_items = Queixa.all.paginate(page: params[:page], per_page: 10)
  @queixas = Queixa.all.paginate(page: params[:page], per_page: 10)
  @empresa = Rails.cache.fetch('empresas', :expires_in => 24.hours){Empresa.order_by_total}
    else
  @feed_items = Queixa.paginate(page: params[:page], per_page: 10)
  @empresa = Rails.cache.fetch('empresas', :expires_in => 24.hours){Empresa.order_by_total}
  @queixa = Queixa.all.paginate(page: params[:page], per_page: 10)

end
end

def ranking

if Empresa.count =='0'
      @empresa = Empresa.order_by_total
end
    @empresa = Empresa.all
end

    def categoria
      @ramo = Atividade.all
      @empresa = Empresa.all
      #@empresa = Empresa.all.sort_by(&:atividade)
    end

#def search
  #  @queixa = Queixa.search(params[:search])
 #end

      def contact
      end


      def help
      end

      def about
      end
  end
