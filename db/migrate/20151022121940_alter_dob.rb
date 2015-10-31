class AlterDob < ActiveRecord::Migration
  def up
  	remove_column "teachers", "dob"
  	remove_column "students", "dob"
  	add_column "teachers", "dob", :datetime
  	add_column "students", "dob", :datetime
  end

  def down
  	add_column "teachers", "dob", :string
  	add_column "students", "dob", :string
  	remove_column "teachers", "dob"
  	remove_column "students", "dob"
  	
  end
end
