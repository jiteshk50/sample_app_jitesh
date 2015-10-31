class School < ActiveRecord::Base
	belongs_to :admin_user
	has_many :students
	has_many :classrooms
	has_many :parents
	has_many :teachers
	has_many :exam_results
	

	scope :sorted, lambda{order("school_name")}
	
	
	def name
		"#{first_name} #{last_name}"
	end
end
