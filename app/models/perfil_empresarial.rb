class PerfilEmpresarial < ApplicationRecord
belongs_to :empresa
belongs_to :user,  optional: true
belongs_to :situacao,  optional: true
#attr_accessor :user_id, :empresa_id, :situacao_id

#belongs_to :empresas, class_name: 'Empresa', foreign_key: 'empresa_id'
accepts_nested_attributes_for :empresa, update_only: true

#, optional: true

end
