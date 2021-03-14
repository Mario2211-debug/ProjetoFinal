class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def ativas
    ativas = Empresa.where(situacao:6)
  end

  def total_de_queixas_diarias
    Queixa.where("created_at >= ? AND created_at < ? ", Time.now.beginning_of_day, Time.now.end_of_day).sum(:id)
  end

  def total_de_queixas_semanais
    Queixa.where("created_at >= ?", Time.now.beginning_of_week).sum(:id)
  end

  def total_de_queixas_mensais
    Queixa.where("created_at >= ?", Time.now.beginning_of_month).sum(:id)

  end

  def queixas_dos_ultimos_7_dias
    Queixa.where("created_at >= ? ", (Date.today - 7.days).beginning_of_day).sum(:id)
  end


  def queixas_dos_ultimos_30_dias
    Queixa.where("created_at >= ? ", (Date.today - 30.days).beginning_of_day).sum(:id)

  end


  def ava
  @ava = (votos.count)
  end

  def indiceR
    @queixas =  queixas.count
  @indiceR =  (queixas.where.not(replica:nil).count).fdiv(@queixas)*100
  end

  def indiceS
    @queixas =  queixas.count
  @indiceS = (queixas.where(situacao_id:1).count).fdiv(@queixas)*100
  end

  def indiceSR
    @queixas =  queixas.count
  @indiceS = (queixas.where(replica:nil).count).fdiv(@queixas)*100

  end

  def indiceNN
    @queixas =  queixas.count
  @indiceNN = (queixas.where(novos_negocios:"Sim").count).fdiv(@queixas)
  end

    def indiceNR
      @queixas =  queixas.count
    @indiceR =  (queixas.where(replica:nil).count).fdiv(@queixas)*100
    end




  def total

if votos.count == 0
  @ava = 0
else
  @ava = (votos.count)
end

if queixas.count == 0
  @queixas = 0
else
  @queixas =  queixas.count
end

if  queixas.where.not(replica:nil).count == 0
  @indiceR = 0
else
  @indiceR =  ((queixas.where.not(replica:nil).count).fdiv(@queixas)*100).to_f
end

if queixas.where(novos_negocios:"Sim").count == 0
  @indiceNN = 0
else
  @indiceNN = ((queixas.where(novos_negocios:"Sim").count).fdiv(@queixas)*100).to_f
end

if queixas.where(situacao_id: 1).count == 0
  @indiceS =  0
else
  @indiceS =  ((queixas.where(situacao_id: 1).count).fdiv(@queixas)*100).to_f
end
#  @ava = (votos.count)
#  @queixas =  queixas.count
#  @indiceR =  ((queixas.where.not(replica:nil).count).fdiv(@queixas)*100).to_f
#  @indiceNN = ((queixas.where(novos_negocios:"Sim").count).fdiv(@queixas)*100).to_f
#  @indiceS =  ((queixas.where(situacao_id: 1).count).fdiv(@queixas)*100).to_f
 @total =  (((@indiceR*2)+(@ava*10*3)+(@indiceS*3)+(@indiceNN*2)).fdiv(100))
  end

  def self.order_by_total()
    Empresa.all.sort_by(&:total).last(5).reverse
  end



  def self.indiceR
    Empresa.all.sort_by(&:indiceR).last(5).reverse
  end

  def self.indiceS
    Empresa.all.sort_by(&:indiceS).last(5).reverse
  end

  def self.indiceSR
    Empresa.all.sort_by(&:indiceSR).last(5).reverse
  end

  def self.indiceNN
    Empresa.all.sort_by(&:indiceNN).last(5).reverse
  end

  def self.indiceNR
    Empresa.all.sort_by(&:indiceNR).last(5).reverse
  end

  def self.ava
    Empresa.all.sort_by(&:ava).last(5).reverse
  end

def ramo
  Atividade.all
end
end
