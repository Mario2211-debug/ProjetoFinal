class Ordem < ApplicationRecord
  has_many_attached:file
  belongs_to :user, optional: true
  belongs_to :queixa
  belongs_to :empresa, optional: true

end
