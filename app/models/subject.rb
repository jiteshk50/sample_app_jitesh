class Subject < ActiveRecord::Base
	belongs_to :exam_type
	has_many :exam_results

	scope :sorted, lambda{order("subject_name")}
end
