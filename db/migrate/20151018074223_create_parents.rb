class CreateParents < ActiveRecord::Migration
  def up
    create_table :parents do |t|

    	t.string "parent_name", :limit=>100
      t.integer "position"
      t.boolean "visible" , :default => false
    	t.string "parent_address", :limit=>255
    	t.string "parent_mobile", :limit => 12
    	

      t.timestamps
    end
    add_index("parents", "parent_name")
  end

  def down
  	drop_table :parents
  end
end
