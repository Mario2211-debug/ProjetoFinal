class CreateSentimentos < ActiveRecord::Migration[5.2]
  def change
    create_table :sentimentos do |t|
      t.string :nome, limit: 80
      t.boolean :activo, default: true, null: false
      t.timestamps
    end
  end
end
