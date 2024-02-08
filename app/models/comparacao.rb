class Comparacao < ApplicationRecord
  ## user has many comparisons. Each comparison contains two movies, superior and inferior.
belongs_to :primeira, class_name: "Empresa"
belongs_to :segunda, class_name: "Empresa"
belongs_to :user

## only one instance of a comparison allowed.
validates :user_id, uniqueness: {scope: [:segunda_id, :primeira_id] }
end
