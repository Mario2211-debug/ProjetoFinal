class Contacto < ApplicationRecord
  enum tipo: [:Casa, :Escritório, :Fax, :Pessoal]
end
