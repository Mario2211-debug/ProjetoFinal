class CreateAssuntos < ActiveRecord::Migration[5.2]
  def change
    create_table :assuntos do |t|
      t.string :nome, limit: 80
    	t.boolean :ativo, default: true, null: false
      t.references :empresa, index: true, foreign_key: true
      t.references :atividade, index: true, foreign_key: true
      t.timestamps
    end
  end
end
