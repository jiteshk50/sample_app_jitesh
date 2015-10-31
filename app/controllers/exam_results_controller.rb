class ExamResultsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_school
  before_action :find_student
  before_action  :find_classroom


  def index
    @exam_results = ExamResult.where(:school_id => @school).sorted
  end

  def new
    @exam_result = ExamResult.new
    @subjects = Subject.sorted
    @classrooms = Classroom.sorted
    @exam_types = ExamType.sorted
    @students = Student.sorted
   
    
    @exam_result_count = ExamResult.count + 1
  end

  def show
    @exam_result = ExamResult.find(params[:id])
    
  end

  def create
    @exam_result = ExamResult.new(exam_result_params)
    if @exam_result.save
      flash[:notice] = 'ExamResult Created'
      redirect_to(:action => 'index')
    else
      @subjects = Subject.sorted
      @classrooms = Classroom.sorted
      @exam_types = ExamType.sorted
      @students = Student.sorted
      @exam_result_count = ExamResult.count + 1
      render("new")
    end

  end

  def edit
    @exam_result = ExamResult.find(params[:id])
    @subjects = Subject.sorted
    @classrooms = Classroom.sorted
    @exam_types = ExamType.sorted
    @students = Student.sorted
    @exam_result_count = ExamResult.count
  end

  def update
    @exam_result = ExamResult.find(params[:id])
    if @exam_result.update_attributes(exam_result_params)
      flash[:notice] = 'ExamResult Updated'
      redirect_to(:action=>'index')
    else
      @subjects = Subject.sorted
      @classrooms = Classroom.sorted
      @exam_types = ExamType.sorted
      @students = Student.sorted
      @exam_result_count = ExamResult.count
      render("edit")
    end
  end

  def delete
    @exam_result = ExamResult.find(params[:id])
  end
  def destroy
    ExamResult.find(params[:id]).destroy
    flash[:notice]= "ExamResult Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def exam_result_params
    params.require(:exam_result).permit(:exam_type_id, :school_id, :student_id, :subject_id, :classroom_id, :marks, :grade, :visible)
  end
end
