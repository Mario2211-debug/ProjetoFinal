class Queixa < ApplicationRecord
  self.table_name = 'queixas'
  #  self.inheritance_column = "not_sti"
    broadcasts_to -> (queixa) {:queixas}

#searchkick word_start: [:descricao, :titulo, :assunto_id, :empresa_id]
  after_commit :total, on:[:create, :destroy, :update]
  after_commit :create_notifications, on: [:create]
#after_create_commit ->(queixa) { broadcast_append_to :empresa, partial: "empresas/queixas" }
#after_update_commit ->(queixa) { broadcast_replace_to :empresa, partial: "empresas/queixas" }
#after_destroy_commit ->(queixa) { broadcast_remove_to :empresa, partial: "empresas/queixas"}


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

public
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

  def omin_search
      queixa = Queixa.all
      queixa = queixa.where(['lower(descricao) LIKE ? OR lower(titulo) LIKE ? OR lower(empresa_nome) LIKE ? OR lower(assunto_nome) LIKE ? OR lower(sentimento_nome) LIKE ?', descricao, descricao, descricao, descricao, descricao]) if descricao.present?
      #queixa = queixa.where(['empresa_nome LIKE ?', descricao]) if descricao.present?
    #  queixa = queixa.where(['assunto_id LIKE ?', assunto]) if assunto.present?
    #  queixa = queixa.where(['lower(titulo) LIKE ?', titulo]) if titulo.present?
      return queixa
  end

  #def self.search(titulo, descricao, empresa, assunto)
#return scoped unless titulo.present? || descricao.present? || empresa.present? || assunto.present?
#where(['titulo LIKE ? AND descricao LIKE ? AND empresa LIKE ? AND assunto LIKE ? ', "%#{titulo}%",  "%#{descricao}%",  "%#{empresa}%", "%#{assunto}%"])
  #end

  def ava
    @ava = empresa.votos.count
  end

  def indiceR
    @queixas = queixas.count
    @indiceR = (queixas.where.not(replica: nil).count).fdiv(@queixas) * 100
  end

  def indiceS
    @queixas = queixas.count
    @indiceS = (queixas.where(situacao_id: 1).count).fdiv(@queixas) * 100
  end

  def indiceSR
    @queixas = queixas.count
    @indiceS = (queixas.where(replica: nil).count).fdiv(@queixas) * 100
  end

  def indiceNN
    @queixas = queixas.count
    @indiceNN = (queixas.where(novos_negocios: "Sim").count).fdiv(@queixas) * 100
  end

  def indiceNR
    @queixas = queixas.count
    @indiceR = (queixas.where(replica: nil).count).fdiv(@queixas) * 100
  end

  def total
    @ava = empresa.votos.count
    @queixas = empresa.queixas.count

    @indiceR = ((empresa.queixas.where.not(replica: nil).count).fdiv(@queixas) * 100).to_f
    @indiceNN = ((empresa.queixas.where(novos_negocios: "Sim").count).fdiv(@queixas) * 100).to_f
    @indiceS = ((empresa.queixas.where(situacao_id: 1).count).fdiv(@queixas) * 100).to_f

    @total = (((@indiceR * 2) + (@ava * 10 * 3) + (@indiceS * 3) + (@indiceNN * 2)).fdiv(100)).to_f
    empresa.update!(rank: @total)
  end

end
