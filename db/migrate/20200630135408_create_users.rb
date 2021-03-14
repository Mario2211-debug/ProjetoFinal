class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
 	# t.string :email, limit: 80
    	t.string :nome, limit: 80
    	t.string :email
      #t.string :encrypted_password
    	t.boolean :ativo, default: true, null: false
    	t.string :B_I
    	t.integer :kind
      t.references :empresa, index: true, foreign_key: true
      t.string :password_digest
      t.string :remember_digest
      t.timestamps
    end
  end
end
