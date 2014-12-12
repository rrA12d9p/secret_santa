class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |u|
      u.string :email, null: false
      u.string :password_digest, null: false
      u.integer :secret_santee_id
      u.integer :secret_santa_id
      u.timestamps
    end
  end
end