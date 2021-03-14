class AddColumnObservacaoToPerfilEmpresarial < ActiveRecord::Migration[5.2]
  def change
    add_column :perfil_empresarials, :observacao, :string
  end
end
