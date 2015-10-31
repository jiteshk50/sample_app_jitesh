class Parent < ActiveRecord::Base
	has_many :students
	belongs_to :school

	scope :sorted, lambda{order("parent_name")}
end
