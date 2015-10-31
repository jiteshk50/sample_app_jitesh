class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|

    	t.string "subject_name", :limit => 50
    	t.integer "exam_type_id"

      t.timestamps
    end
  end

  def down
  	drop_table :subjects
  end
end
