class Empresa < ApplicationRecord
  acts_as_taggable_on :sabor

  has_one_attached :avatar
  belongs_to :atividade
  has_many :assuntos, dependent: :destroy
  has_one :contacto
  has_one :endereco
  has_many :queixas, dependent: :destroy
  belongs_to :situacao, optional: true
  has_one :addempresa
  has_one :perfil_empresarial
  has_one :user, through: :perfil_empresarial
  has_many :votos
  has_many :novos_negocios
  has_many :ordems

  has_many :primeiras_comparacoes, foreign_key: :primeira_id, class_name: 'Comparacoes'
  has_many :segundas_comparacoes, foreign_key: :segunda_id, class_name: 'Comparacoes'
  has_many :segundas_comparacoes, through: :primeiras_comparacoes
  has_many :primeiras_comparacoes, through: :segundas_comparacoes

  accepts_nested_attributes_for :assuntos, :endereco, :contacto, :addempresa, allow_destroy: true

  $sabores = %w[sweet citrusy sour strong bitter]

  def displayed_image
    avatar.attached? ? avatar : 'blank.png'
  end

  validate :acceptable_image_type?

  def acceptable_image_type?
    return unless avatar.attached?

    unless avatar.content_type.in?(['image/png', 'image/jpeg'])
      errors.add :avatar, 'Apenas imagens em formato PNG ou JPEG são permitidas.'
    end
  end

  def total_de_queixas_diarias
    Queixa.where(created_at: Time.now.beginning_of_day..Time.now.end_of_day).sum(:id)
  end

  def total_de_queixas_semanais
    Queixa.where('created_at >= ?', Time.now.beginning_of_week).sum(:subtotal)
  end

  def total_de_queixas_mensais
    Queixa.where('created_at >= ?', Time.now.beginning_of_month).sum(:subtotal)
  end

  def self.filtro_por_ramo(ramo)
    Empresa.where(atividade: ramo)
  end
end
