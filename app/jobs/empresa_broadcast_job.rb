#class EmpresaBroadcastJob < ApplicationJob
#  queue_as :default

##    ActionCable.server.broadcast 'empresa_channel', item: render(empresa)
#  end

#  private
#    def render(empresa)
#        ApplicationController.renderer.render(partial: 'empresas/queixas', locals: {empresa: empresa})
#    end
#end
