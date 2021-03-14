class CreatePerfilEmpresarials < ActiveRecord::Migration[5.2]
  def change
    create_table :perfil_empresarials do |t|
      t.references :user, foreign_key: true
      t.references :empresa, foreign_key: true
      t.references :situacao, foreign_key: true
      t.timestamps
    end
  end
end
