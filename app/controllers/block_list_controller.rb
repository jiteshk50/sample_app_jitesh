class BlockListController < ApplicationController
   before_action :confirm_logged_in
  
  def index
  	@block_lists = BlockList.bsorted
  end

  def new
  	@block_list = BlockList.new
  end

  def create
  	@block_list = BlockList.new(block_list_params)
  	if @block_list.save
  		flash[:notice] = 'Block Created'
  		redirect_to(:action => 'index')
  	else
  		render("new")
  	end

  end

  def edit
  	@block_list = BlockList.find(params[:id])
  end

  def update
  	@block_list = BlockList.find(params[:id])
  	if @block_list.update_attributes(block_list_params)
  		flash[:notice] = 'Block Updated'
  		redirect_to(:action=>'index')
  	else
  		render("edit")
  	end
  end

  def delete
  	@block_list = BlockList.find(params[:id])
  end
  def destroy
  	BlockList.find(params[:id]).destroy
  	flash[:notice]= "Block Destroyed"
  	redirect_to(:action=>'index')
  end


  private

  def block_list_params
  	params.require(:block_list).permit(:block_name)
  end
end
