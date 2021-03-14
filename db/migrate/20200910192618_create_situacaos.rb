class CreateSituacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :situacaos do |t|
      t.string :nome, limit: 80
      t.string :escopo
      t.timestamps
      t.timestamps
    end
  end
end
