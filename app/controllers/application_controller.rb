class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_logged_in
  	unless session[:user_id]
  	  		flash[:notice] = "please log in"
  	  		redirect_to(:controller => 'access', :action => 'login')
  	 return false

  	else
  		return true
  	end
  end


  def find_school
     @school = School.where(:admin_user_id=>session[:user_id]).sorted
  end

  def find_teacher
     @schoolTeacher = Teacher.where(:school_id=>@school).sorted
  end
  def find_parent

    @studentParent = Parent.where(:school_id=>@school).sorted
  end

  def find_student

    @classroomStudent = Student.where(:school_id=>@school).sorted
  end

  def find_classroom

    @studentClassroom = Classroom.where(:school_id=>@school).sorted
  end
end
