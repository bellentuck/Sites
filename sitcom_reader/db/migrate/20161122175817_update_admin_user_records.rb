class UpdateAdminUserRecords < ActiveRecord::Migration[5.0]
  def up
    remove_column("admin_users", "first_name")
    remove_column("admin_users", "last_name")

  end

  def down
    add_column("admin_users", "first_name")
    add_column("admin_users", "last_name")    
  end
end
