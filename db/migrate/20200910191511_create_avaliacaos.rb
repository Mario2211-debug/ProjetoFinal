class CreateAvaliacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :avaliacaos do |t|
      t.integer :valor, limit: 80
      t.timestamps
    end
  end
end
