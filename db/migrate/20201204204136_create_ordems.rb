class CreateOrdems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordems do |t|
      t.references :empresa, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :queixa, index: true, foreign_key: true
      t.integer :numero, limit: 80
      t.timestamps
    end
  end
end
