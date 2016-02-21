class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :authentication_token
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :authentication_token, unique: true
  end
end
