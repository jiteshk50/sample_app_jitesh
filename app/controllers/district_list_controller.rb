class DistrictListController < ApplicationController
 
  before_action :confirm_logged_in
 def index
  	@district_lists = DistrictList.dsorted
  end

  def new
  	@district_list = DistrictList.new
  end

  def create
  	@district_list = DistrictList.new(district_list_params)
  	if @district_list.save
  		flash[:notice] = 'District Created'
  		redirect_to(:action => 'index')
  	else
  		render("new")
  	end

  end

  def edit
  	@district_list = DistrictList.find(params[:id])
  end

  def update
  	@district_list = DistrictList.find(params[:id])
  	if @district_list.update_attributes(district_list_params)
  		flash[:notice] = 'District Updated'
  		redirect_to(:action=>'index')
  	else
  		render("edit")
  	end
  end

  def delete
  	@district_list = DistrictList.find(params[:id])
  end
  def destroy
  	DistrictList.find(params[:id]).destroy
  	flash[:notice]= "District Destroyed"
  	redirect_to(:action=>'index')
  end


  private

  def district_list_params
  	params.require(:district_list).permit(:district_name)
  end
end
