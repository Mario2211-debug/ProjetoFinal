class CreateComparacaos < ActiveRecord::Migration[6.1]
  def change
    create_table :comparacaos do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :inferior_id
      t.integer :superior_id
      t.timestamps
    end
  end
end
