class CreateBlockLists < ActiveRecord::Migration
  def change
    create_table :block_lists do |t|

    	t.string "block_name"

      t.timestamps
    end
  end
end
