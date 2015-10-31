class AlterExamResults < ActiveRecord::Migration
  def up
  	add_column "exam_results", "school_id", :integer
  end

  def down
  	remove_column "exam_results", "school_id"
  end
end
