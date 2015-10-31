class Student < ActiveRecord::Base
	belongs_to :school
	belongs_to :classroom
	belongs_to :parent

	has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100#" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	validates_attachment :image, presence: true,
  content_type: { content_type: "image/jpeg" },
  size: { in: 0..50.kilobytes }

	scope :sorted, lambda{order(" students.student_last_name, students.student_first_name")}
	def name
		"#{student_first_name} #{student_last_name}"
	end
end
