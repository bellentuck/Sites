class CreateAdminUsers < ActiveRecord::Migration[5.0]

  def up
    create_table :admin_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email", :default => '', :null => false
      t.string "username"
      t.string "hashed_password"
      t.timestamps
    end
  end

  def down
    drop_table :admin_users
  end

end
