class AlterParent < ActiveRecord::Migration
  def up
  	add_column "parents", "school_id", :integer
  end
  def down
  	remove_column  "parents","school_id"
  end
end
