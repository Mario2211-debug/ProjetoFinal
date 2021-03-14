class Queixa < ApplicationRecord
  self.table_name = 'queixas'

    self.inheritance_column = "not_sti"

#searchkick word_start: [:descricao, :titulo, :assunto_id, :empresa_id]
  after_commit :create_notifications, on: [:create]
#after_create_commit ->(queixa) { broadcast_append_to :empresa, partial: "empresas/queixas" }
#after_update_commit ->(queixa) { broadcast_replace_to :empresa, partial: "empresas/queixas" }
#after_destroy_commit ->(queixa) { broadcast_remove_to :empresa, partial: "empresas/queixas"}
  broadcasts_to -> (queixa) {:queixas}

after_create :total

  belongs_to :assunto, optional: true
  belongs_to :sentimento, optional: true
  belongs_to :situacao, optional: true
  belongs_to :user
  belongs_to :empresa
  belongs_to :avaliacao, optional: true
  has_one :ordem, dependent: :destroy
  accepts_nested_attributes_for :ordem, allow_destroy: true


=begin
  def search_data
  {
    descricao: descricao,
    titulo: titulo,
    assunto_id: assunto_id,
    empresa_id: empresa_id,
  }
  end
=end

private
   def create_notifications
     Notification.create do |notificacao|
      notificacao.notify_type =  'queixa'
       notificacao.actor = self.user
       notificacao.user = self.empresa.user
       notificacao.target = self
       notificacao.second_target = self.empresa
     end
     end


  #default_scope -> { order(created_at: :desc) }
  enum novos_negocios: [:Sim, :Não]
  #def self.search(search)
    #where("lower(empresas.nome) LIKE :search OR lower(queixas.titulo) LIKE :search OR lower(queixas.descricao) LIKE :search ",  search: "%#{search.downcase}%").uniq
  #end

  #  def self.search(search)
  #      if search
  #          where(["descricao LIKE ?","%#{search}%"])
  #      else
  #          all
  #      end
  #  end


  #def self.search(titulo, descricao, empresa, assunto)
#return scoped unless titulo.present? || descricao.present? || empresa.present? || assunto.present?
#where(['titulo LIKE ? AND descricao LIKE ? AND empresa LIKE ? AND assunto LIKE ? ', "%#{titulo}%",  "%#{descricao}%",  "%#{empresa}%", "%#{assunto}%"])
  #end

  def ava
  @ava = (empresa.votos.count)
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
  if empresa.votos.count == 0
    @ava = 0
  else
    @ava = (empresa.votos.count)
  end

  if empresa.queixas.count == 0
    @queixas = 0
  else
    @queixas =  empresa.queixas.count
  end

  if  empresa.queixas.where.not(replica:nil).count == 0
    @indiceR = 0
  else
    @indiceR =  ((empresa.queixas.where.not(replica:nil).count).fdiv(@queixas)*100).to_f
  end

  if empresa.queixas.where(novos_negocios:"Sim").count == 0
    @indiceNN = 0
  else
    @indiceNN = ((empresa.queixas.where(novos_negocios:"Sim").count).fdiv(@queixas)*100).to_f
  end

  if empresa.queixas.where(situacao_id: 1).count == 0
    @indiceS =  0
  else
    @indiceS =  ((empresa.queixas.where(situacao_id: 1).count).fdiv(@queixas)*100).to_f
  end

  #  @ava = (votos.count)
  #  @queixas =  queixas.count
  #  @indiceR =  ((queixas.where.not(replica:nil).count).fdiv(@queixas)*100).to_f
  #  @indiceNN = ((queixas.where(novos_negocios:"Sim").count).fdiv(@queixas)*100).to_f
  #  @indiceS =  ((queixas.where(situacao_id: 1).count).fdiv(@queixas)*100).to_f
   @total =  (((@indiceR*2)+(@ava*10*3)+(@indiceS*3)+(@indiceNN*2)).fdiv(100))
   empresa.update!(rank:@total)
    end



#def resolvida
#Queixa.where('updated_at > ?', 24.hours.ago)
#end

#def sem_resposta
#  Queixa.where(replica: nil)
#end


end
