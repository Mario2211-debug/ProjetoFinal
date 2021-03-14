class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :nome
      t.string :empresa
      t.string :assunto
      t.string :situacao

      t.timestamps
    end
  end
end
