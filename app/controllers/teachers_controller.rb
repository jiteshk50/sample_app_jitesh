class TeachersController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_school

  def index
  # @teachers = Teacher.sorted
  @teachers = Teacher.where(:school_id => @school).sorted
  end

  def new
    @teacher = Teacher.new
    @schools = School.sorted
   
    
    @teacher_count = Teacher.count + 1
  end

  def show
    @teacher = Teacher.find(params[:id])
    
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice] = 'Teacher Created'
      redirect_to(:action => 'index')
    else
      @schools = School.sorted
      @teacher_count = Teacher.count + 1
      render("new")
    end

  end

  def edit
    @teacher = Teacher.find(params[:id])
    @schools = School.sorted
    @teacher_count = Teacher.count
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(teacher_params)
      flash[:notice] = 'Teacher Updated'
      redirect_to(:action=>'index')
    else
      @schools = School.sorted
      @teacher_count = Teacher.count
      render("edit")
    end
  end

  def delete
    @teacher = Teacher.find(params[:id])
  end
  def destroy
    Teacher.find(params[:id]).destroy
    flash[:notice]= "Teacher Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def teacher_params
    params.require(:teacher).permit(:teacher_name, :position, :visible, :email, :dob, :teacher_phone, :address, :school_id)
  end

  
end
