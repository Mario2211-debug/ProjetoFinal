class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email, limit: 80
          	t.string :nome, limit: 80
            t.string :email,  null: false, default: ""
            t.string :password_digest
          #  t.string :password, null: false, default: ""

            ## Recoverable
          #  t.string   :reset_password_token
          #  t.datetime :reset_password_sent_at

            ## Rememberable
          #  t.datetime :remember_created_at

            ## Trackable
            # t.integer  :sign_in_count, default: 0, null: false
            # t.datetime :current_sign_in_at
            # t.datetime :last_sign_in_at
            # t.string   :current_sign_in_ip
            # t.string   :last_sign_in_ip

            ## Confirmable
            # t.string   :confirmation_token
            # t.datetime :confirmed_at
            # t.datetime :confirmation_sent_at
            # t.string   :unconfirmed_email # Only if using reconfirmable

      t.timestamps
    end
  end
end
