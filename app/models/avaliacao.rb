class Avaliacao < ApplicationRecord
  belongs_to :queixa
  validates_presence_of :queixa
  validates_inclusion_of :value, :in => 1..10
end
