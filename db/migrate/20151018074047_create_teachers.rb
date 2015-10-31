class CreateTeachers < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
    	t.string "teacher_name", :limit=>50
      t.integer "position"
      t.boolean "visible" , :default => false
    	t.string "email", :default=>"", :null=>false
    	t.string "dob", :default => ""
    	t.string "teacher_phone", :limit => 12
    	t.string "address", :limit=>255
    	t.integer "school_id"

      t.timestamps
    end
    add_index("teachers", "teacher_name")
  end
  def down
  	drop_table :teachers
  end
end
