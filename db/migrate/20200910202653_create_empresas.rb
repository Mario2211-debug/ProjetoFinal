class CreateEmpresas < ActiveRecord::Migration[5.2]
  def change
    create_table :empresas do |t|
      t.references :atividade, foreign_key: true
      t.references :situacao, foreign_key: true
      t.string :nome, limit: 80
      t.string :nif, limit: 50
      t.string :responsavel, limit: 60
      t.string :email
      t.string :sobre

      t.timestamps
    end
  end
end
