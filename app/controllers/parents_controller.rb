class ParentsController < ApplicationController
 before_action :confirm_logged_in
 before_action :find_school

 def index
    @parents = Parent.where(:school_id => @school).sorted
  end

  def new
    @parent = Parent.new
    @schools = School.sorted
   
    
    @parent_count = Parent.count + 1
  end

  def show
    @parent = Parent.find(params[:id])
    
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      flash[:notice] = 'Parent Created'
      redirect_to(:action => 'index')
    else
      @schools = School.sorted
      @parent_count = Parent.count + 1
      render("new")
    end

  end

  def edit
    @parent = Parent.find(params[:id])
    @schools = School.sorted
    @parent_count = Parent.count
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(parent_params)
      flash[:notice] = 'Parent Updated'
      redirect_to(:action=>'index')
    else
      @schools = School.sorted
      @parent_count = Parent.count
      render("edit")
    end
  end

  def delete
    @parent = Parent.find(params[:id])
  end
  def destroy
    Parent.find(params[:id]).destroy
    flash[:notice]= "Parent Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def parent_params
    params.require(:parent).permit(:parent_name, :position, :visible, :parent_address, :parent_mobile, :school_id)
  end
end
