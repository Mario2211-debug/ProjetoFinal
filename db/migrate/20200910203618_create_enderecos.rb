class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.references :user, foreign_key: true
      t.references :empresa, foreign_key: true
      t.integer :cidade
      t.integer :destrito
      t.string :bairro
      t.string :rua
      t.integer :numero
      t.text :observacao
      t.date :data_execucao
      t.timestamps
    end
  end
end
