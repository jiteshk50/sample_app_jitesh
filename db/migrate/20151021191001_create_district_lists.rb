class CreateDistrictLists < ActiveRecord::Migration
  def change
    create_table :district_lists do |t|

    	t.string "district_name"

      t.timestamps
    end
  end
end
