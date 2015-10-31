class ExamTypesController < ApplicationController
  before_action :confirm_logged_in

  def index
  	@exam_types = ExamType.sorted
    
  end

  def new
  	@exam_type = ExamType.new
    
  end

  def create
  	@exam_type = ExamType.new(exam_type_params)
  	if @exam_type.save
  		flash[:notice] = 'Exam Type Created'
  		redirect_to(:action => 'index')
  	else
  		render("new")
  	end

  end

  def edit
  	@exam_type = ExamType.find(params[:id])
  end

  def update
  	@exam_type = ExamType.find(params[:id])
  	if @exam_type.update_attributes(exam_type_params)
  		flash[:notice] = 'Exam Type Updated'
  		redirect_to(:action=>'index')
  	else
  		render("edit")
  	end
  end

  def delete
  	@exam_type = ExamType.find(params[:id])
  end
  def destroy
  	ExamType.find(params[:id]).destroy
  	flash[:notice]= "Exam Type Destroyed"
  	redirect_to(:action=>'index')
  end


  private

  def exam_type_params
  	params.require(:exam_type).permit(:exam_name)
  end
end
