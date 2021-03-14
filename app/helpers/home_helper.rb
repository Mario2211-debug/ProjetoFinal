module HomeHelper
  def ranking
  @empresa = Empresa.find(params[:id])
  @ranking = @empresa.total
    end
end
