class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 25
    	t.string "username", :limit => 25
    	t.string "email", :default => "", :null=>false
    	t.string "password", :limit=>40

      t.timestamps
    end
    add_index("admin_users" , "username")
  end
  def down
  	drop_table :admin_users
  end
end
