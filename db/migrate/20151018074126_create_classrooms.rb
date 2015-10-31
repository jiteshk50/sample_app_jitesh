class CreateClassrooms < ActiveRecord::Migration
  def up
    create_table :classrooms do |t|
    	
    	t.string "classroom_name", :limit=> 20
      t.integer "position"
      t.string "session", :limit=> 20
      t.boolean "visible" , :default => false
    	t.string "section", :limit => 20
    	t.boolean "status", :default => true
    	t.string "remarks", :limit=>255
    	t.integer "school_id"
    	t.integer "teacher_id"


      t.timestamps
    end
    add_index("classrooms", "classroom_name")
  end
  def down
  	drop_table :classrooms
  end
end
