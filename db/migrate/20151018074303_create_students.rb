class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|

    	t.string "student_first_name" , :limit=>25
    	t.string "student_last_name", :limit=>25
      t.integer "position"
      t.boolean "visible" , :default => false
    	t.string "dob", :null=>false
    	t.string "father_name", :limit=>50
    	t.string "mother_name", :limit=>50
    	t.integer "school_id"
    	t.integer "parent_id"
    	t.integer "classroom_id"


      t.timestamps
    end
    add_index("students", "student_first_name")
  end

  def down
  	drop_table :students
  end
end
