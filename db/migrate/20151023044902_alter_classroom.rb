class AlterClassroom < ActiveRecord::Migration
  def up
  	remove_column "classrooms", "status"
  	remove_column "classrooms", "remarks"
  end

  def down
  	add_column "classrooms", "status", :boolean
  	add_column "classrooms", "remarks", :string
  end
end
