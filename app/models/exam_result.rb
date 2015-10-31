class ExamResult < ActiveRecord::Base
	belongs_to :classroom
	belongs_to :exam_type
	belongs_to :student
	belongs_to :subject
	belongs_to :school

	scope :sorted, lambda{order("grade")}

	
end
