class CreateExamTypes < ActiveRecord::Migration
  def up
    create_table :exam_types do |t|
    	t.string "exam_name", :limit=>50
      t.timestamps
    end
  end
  def down
  	drop_table :exam_types
  end
end
