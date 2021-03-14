class Addempresa < ActiveRecord::Migration[5.2]
  def change
    create_table :addempresas do |t|

    t.references :empresa, foreign_key: true
    t.references :situacao, foreign_key: true
    t.references :user, foreign_key: true
    t.references :admin, foreign_key: true
    
    t.string :observacao
    t.string :nome
    t.string :email

    t.timestamps

end
  end
end
