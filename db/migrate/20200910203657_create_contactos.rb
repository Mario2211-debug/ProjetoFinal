class CreateContactos < ActiveRecord::Migration[5.2]
  def change
    create_table :contactos do |t|
      t.references :user, foreign_key: true
      t.references :empresa, foreign_key: true
      t.integer :tipo
      t.string :valor
      t.boolean :status, default: true, null: false

      t.timestamps
    end
  end
end
