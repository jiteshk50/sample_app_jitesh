class AddAttachmentImageToStudents < ActiveRecord::Migration
  def up
    add_attachment :students, :image
  end

  def down
    remove_attachment :students, :image
  end
end
