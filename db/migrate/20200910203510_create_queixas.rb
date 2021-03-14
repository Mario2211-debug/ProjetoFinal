class CreateQueixas < ActiveRecord::Migration[5.2]
  def change
    create_table :queixas do |t|
      t.references :sentimento, foreign_key: true
      t.references :avaliacao, foreign_key: true
      t.references :user, foreign_key: true
      t.references :empresa, foreign_key: true
      t.references :situacao, foreign_key: true
      t.references :assunto, foreign_key: true
      t.string :titulo, limit: 80
      t.text :descricao
      t.string :replica
      t.string :slug
      t.string :mensagem
      t.integer :novos_negocios
      t.timestamps
    end
  end
end
