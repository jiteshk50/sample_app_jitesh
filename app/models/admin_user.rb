class AdminUser < ActiveRecord::Base
	
	has_secure_password

	has_one :school

	

	scope :sorted, lambda{order("admin_users.last_name, admin_users.first_name")}
	def name
		"#{first_name} #{last_name}"
	end

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 25
	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 50
	validates_presence_of :username
	validates_length_of :username, :within => 8..25
	validates_uniqueness_of :username
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX
	validates_confirmation_of :email
	
end
