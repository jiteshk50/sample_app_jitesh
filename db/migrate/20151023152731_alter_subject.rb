class AlterSubject < ActiveRecord::Migration
  def up
  	remove_column "subjects", "exam_type_id"
  end

  def down
  	add_column "subjects", "exam_type_id", :integer
  end
end
