class LinksController < ApplicationController
  
  # before EVERYTHING in here, find the category
  before_action :get_category

  # before EDIT, UPDATE and DESTROY
  before_action :get_link, only: [:edit, :destroy]



  def new
    if params[:duplicate_id].present?
      # do a duplicate of this
      @link = @category.links.find(params[:duplicate_id])
    else
    	@link = @category.links.new
      # make a brand new one
    end
  end

  # new needs a create
  def create
	@link = @category.links.new(link_params)	
  	# if the link saves
  	if @link.save
  		flash[:success] = "Link Added"
  		redirect_to category_path(@category)
  	else
 		render :new 		
  	end
  end



  def edit
  	# removed line here b/c of action_before
  end

  def update
	# Edit needs an update

  	if @link.update(link_params)
  		flash[:success] = "Link was Updated"
  		redirect_to category_path(@category)
  	else
 		render :edit 		
  	end
  end


  def destroy
  	# first find
  	# don't need this because of before_action above @link = @category.links.find(params[:id])
  	# then destroy
  	@link.destroy
  	# send message
  	flash[:success] = "Link was deleted"
  	# go back to category
  	redirect_to category_path(@category)
  end


  def link_params
  	# set the allowable params whiteilist for security
  	params.require(:link).permit(:name, :description, :url)
  end


  def get_category
  	# because we're not in the categories controller
  	# we need to find the ID of the category
  	# using the /categories/:category_d/links/new
  	@category = Category.find(params[:category_id])
  end

  def get_link
  	  	@link = @category.links.find(params[:id])
  end

end