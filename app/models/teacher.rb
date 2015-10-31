class Teacher < ActiveRecord::Base
	belongs_to :school
	has_one :classroom

	scope :sorted, lambda{order("teacher_name")}
end
