class Classroom < ActiveRecord::Base
	has_many :exam_results
	has_many :students
	belongs_to :school
	belongs_to :teacher

	scope :sorted, lambda{order("classroom_name")}
	
	def csection
		classroom_name + ' '+'section' +' '+ section
	end
end
