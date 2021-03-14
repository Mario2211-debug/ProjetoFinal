class CreateVotos < ActiveRecord::Migration[5.2]
  def change
    create_table :votos do |t|
      t.integer :empresa_id
      t.timestamps
    end
  end
end
