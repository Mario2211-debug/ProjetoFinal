class CreateHistoricoEmpresarials < ActiveRecord::Migration[5.2]
  def change
    create_table :historico_empresarials do |t|
      t.references :empresa, foreign_key: true
      t.references :situacao, foreign_key: true
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
