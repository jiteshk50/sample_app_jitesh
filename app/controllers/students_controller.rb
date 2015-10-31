class StudentsController < ApplicationController
  before_action :confirm_logged_in
  before_action :find_school
  before_action :find_parent
  before_action  :find_classroom

  def index
    @students = Student.where(:school_id => @school).sorted
  end

  def new
    @student = Student.new
    @schools = School.sorted
    @parents = Parent.sorted
    @classrooms = Classroom.sorted
   
    
    @student_count = Student.count + 1
  end

  def show
    @student = Student.find(params[:id])
    
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = 'Student Created'
      redirect_to(:action => 'index')
    else
      @schools = School.sorted
      @parents = Parent.sorted
      @classrooms = Classroom.sorted
      @student_count = Student.count + 1
      render("new")
    end

  end

  def edit
    @student = Student.find(params[:id])
    @parents = Parent.sorted
    @classrooms = Classroom.sorted
    @schools = School.sorted
    @student_count = Student.count
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:notice] = 'Student Updated'
      redirect_to(:action=>'index')
    else
      @parents = Parent.sorted
      @classrooms = Classroom.sorted
      @schools = School.sorted
      @student_count = Student.count
      render("edit")
    end
  end

  def delete
    @student = Student.find(params[:id])
  end
  def destroy
    Student.find(params[:id]).destroy
    flash[:notice]= "Student Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def student_params
    params.require(:student).permit(:image, :student_first_name, :student_last_name, :position, :visible, :father_name, :mother_name, :school_id, :parent_id, :classroom_id, :dob)
  end
end
