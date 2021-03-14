class HistoricoEmpresarial < ApplicationRecord
  belongs_to :empresas
  belongs_to :situacaos
  belongs_to :perfil_empresarial
end
