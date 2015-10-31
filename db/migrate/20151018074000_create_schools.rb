class CreateSchools < ActiveRecord::Migration
  def up
    create_table :schools do |t|
    	t.string "school_name", :limit=> 100
      t.integer "position"
      t.boolean "visible" , :default => false
    	t.string "address_line_1", :limit => 50
    	t.integer "PIN", :limit=>6
    	t.string "school_code", :limit=>50
    	t.string "district", :limit=>50
    	t.string "block", :limit=>50
    	t.string "cluster", :limit=>50
    	t.integer "admin_user_id"

      t.timestamps
    end
    add_index("schools", "school_name")
  end
  def down
  	drop_table :schools  	
  end
end
