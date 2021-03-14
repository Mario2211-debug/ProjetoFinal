 class Empresa < ApplicationRecord
  #acts_as_taggable_on :tags (the typical way of adding tags, you don’t need this line if you are adding the next two lines)
  acts_as_taggable_on :sabor
  #acts_as_taggable_on :assuntos
  broadcasts_to -> (queixa) {:queixas}

  has_one_attached :avatar
  belongs_to :atividade
  has_many :assuntos, dependent: :destroy
  has_one :contacto
  has_one :endereco
  belongs_to :situacao, optional: true
  has_one :addempresa
  has_many :queixas, dependent: :destroy
  has_one :perfil_empresarial
  has_one :user,  through: :perfil_empresariEeal
  has_many :votos
  has_many :novos_negocios
  has_many :ordems

  accepts_nested_attributes_for :assuntos, allow_destroy: true
  accepts_nested_attributes_for :endereco, allow_destroy: true
  accepts_nested_attributes_for :contacto, allow_destroy: true
  accepts_nested_attributes_for :addempresa, allow_destroy: true
# accepts_nested_attributes_for :perfilempresarial, allow_destroy: true
# accepts_nested_attributes_for :situacao, allow_destroy: true

  $sabor = ['sweet', 'citrusy', 'sour', 'strong', 'bitter']
  #$assuntos = ["Before Dinner Cocktail", "All Day Cocktail", "Longdrink", "Sparkling Cocktail", "After Dinner Cocktail", "Hot Drink"]

def displayed_image
  if avatar.attached?
    avatar
  else
    "blank.png"
  end
end

validate :acceptable_image_type?

    def acceptable_image_type?
      return unless avatar.attached?
      return if avatar.content_type.in? ["image/png", "image/jpeg"]
      errors.add :avatar, "Só imagens com menos de 1mb"
      end

  def total_de_queixas_diarias
    Queixa.where("created_at >= ? AND created_at < ? ", Time.now.beginning_of_day, Time.now.end_of_day).sum(:id)
  end

 def total_de_queixas_semanais
  Queixa.where("created_at >= ?", Time.now.beginning_of_week).sum(:subtotal)
 end

 def total_de_queixas_mensais
   Queixa.where("created_at >= ?", Time.now.beginning_of_month).sum(:subtotal)
 end

def self.filtro_por_ramo(ramo)
Empresa.all.select do |f|
  empresa.atividade = ramo
end
end

end
