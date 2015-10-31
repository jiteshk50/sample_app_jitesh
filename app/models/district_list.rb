class DistrictList < ActiveRecord::Base

	
	scope :dsorted, lambda{order("district_lists.district_name")}
end
