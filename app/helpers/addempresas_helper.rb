module AddempresasHelper
  def existe(addempresa)
    params[:addempresa_id] = addempresa.id
end
  def pedido_atual
    if (addempresa_id = params[:addempresa_id])
      @pedido_atual ||= Addempresa.find_by(id: addempresa_id)
    else
      user = User.find_by(id: user_id)
    end
  end


  def pedido?
     !pedido_atual.find(params[:id]).nil?
   end

end
