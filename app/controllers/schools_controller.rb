class SchoolsController < ApplicationController
  before_action :confirm_logged_in

  def index
    @schools = School.where(:admin_user_id=>session[:user_id]).sorted
  end

  def new
    @school = School.where(:admin_user_id=>session[:user_id]).new
    @admin_users =AdminUser.sorted
    @district_lists = DistrictList.dsorted
    @block_lists = BlockList.bsorted
    @school_count = School.count + 1
  end

  def show
    @school = School.find(params[:id])
    @district_list = DistrictList.dsorted
  end

  def create
    @school = School.where(:admin_user_id=>session[:user_id]).new(school_params)
    if @school.save
      flash[:notice] = 'School Created'
      redirect_to(:action => 'index')
    else
      @admin_users =AdminUser.sorted
      @district_lists = DistrictList.dsorted
    @block_lists = BlockList.bsorted
      @school_count = School.count + 1
      render("new")
    end

  end

  def edit
    @school = School.find(params[:id])
    @admin_users =AdminUser.sorted
    @district_lists = DistrictList.dsorted
    @block_lists = BlockList.bsorted
    @school_count = School.count
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      flash[:notice] = 'School Updated'
      redirect_to(:action=>'index')
    else
      @admin_users =AdminUser.sorted
      @district_lists = DistrictList.dsorted
    @block_lists = BlockList.bsorted
      @school_count = School.count
      render("edit")
    end
  end

  def delete
    @school = School.find(params[:id])
  end
  def destroy
    School.find(params[:id]).destroy
    flash[:notice]= "School Destroyed"
    redirect_to(:action=>'index')
  end


  private

  def school_params
    params.require(:school).permit(:school_name, :position, :visible, :address_line_1, :PIN, :school_code, :district, :block, :cluster, :admin_user_id)
  end
end
