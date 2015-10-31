class ClassroomsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_school
  before_action :find_teacher


  def index
    @classrooms = Classroom.where(:school_id => @school).sorted
  end

  def new
    @classroom = Classroom.new
    @schools = School.sorted
    @teachers = Teacher.sorted
   
    
    @classroom_count = Classroom.count + 1
  end

  def show
    @classroom = Classroom.find(params[:id])
    
  end

  def create
    @classroom = Classroom.new(classroom_params)
    if @classroom.save
      flash[:notice] = 'Classroom Created'
      redirect_to(:action => 'index')
    else
      @teachers = Teacher.sorted
      @schools = School.sorted
      @classroom_count = Classroom.count + 1
      render("new")
    end

  end

  def edit
    @classroom = Classroom.find(params[:id])
    @teachers = Teacher.sorted
    @schools = School.sorted
    @classroom_count = Classroom.count
  end

  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update_attributes(classroom_params)
      flash[:notice] = 'Classroom Updated'
      redirect_to(:action=>'index')
    else
      @teachers = Teacher.sorted
      @schools = School.sorted
      @classroom_count = Classroom.count
      render("edit")
    end
  end

  def delete
    @classroom = Classroom.find(params[:id])
  end
  def destroy
    Classroom.find(params[:id]).destroy
    flash[:notice]= "Classroom Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def classroom_params
    params.require(:classroom).permit(:classroom_name, :position, :session, :visible, :section, :status, :remarks, :school_id, :teacher_id)
  end
end
