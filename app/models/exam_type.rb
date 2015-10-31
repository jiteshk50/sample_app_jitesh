class ExamType < ActiveRecord::Base
	has_many :subject	

	scope :sorted, lambda{order("exam_name")}
end
