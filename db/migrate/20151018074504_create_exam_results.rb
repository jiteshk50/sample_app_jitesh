class CreateExamResults < ActiveRecord::Migration
  def up
    create_table :exam_results do |t|

    	t.integer "student_id"
    	t.integer "subject_id"
    	t.integer "classroom_id"
    	t.integer "exam_type_id"
    	t.string "marks", :limit=>10
    	t.string "grade", :limit=>10
      t.boolean "visible" , :default => false

      t.timestamps
    end
  end

  def down
  	drop_table :exam_results
  end
end
