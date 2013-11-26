class CategoriesController < ApplicationController

	# I want to run the get_category before the show edit, update, destroy
	# And I don't want to keep repeating myself
	# We can use before_action to do things before any nmethod (aka action)

	before_action :get_category, only: [:show, :edit, :update, :destroy]


	# step 2 is to add an Index page
	# we want to define the index of our controller
	def index
	# name = "ROBERTO"

	# this is where all of our code for the index page lives
	# @username = name
	@username = "Roberto"
	@age = 39

	# to do a list we use an array
	# @categories = [
		# "Design", 
		# "Rails", 
		# "Javascript",
		# "Site Tools",
		# "Data Vis"
	# ]

	# now let's talk to the model
	@categories = Category.all.order("rank asc, name asc")
	end



	# let's add a show page here
	def show
		# I don't need it anymore before I now have before_action
		# get_category
		# @category is a variable i've named
		# find is looking for a row based on the ID
		# get_category
	end



	# the new form for a category
	def new
		@category = Category.new
	end	



	#add the category using the data the form has in it
	def create
		@category = Category.new(category_params)		
		
		# let's add a conditional statement
		# rails doens't need curly brackets
		
		if @category.save
			
			# tell the user they've created a new category
			flash[:success] = "Category has been created"
			#go back to the homepage
			redirect_to root_path		

		else
			# if category does not save stay in create form, but show errors 
			# advise the user there's been a validation error
			# we've already got the form we want to show (new.html.erb)

			render "new"
			# flash[:success] = "Category was not created, look at errors below"
		end
		



	end



	# get a form to edit this category 
	def edit
		# I don't need it anymore before I now have before_action
		# get_category
	end	



	# actually update the row in the database
	def update

		if @category.update(category_params)
			# I don't need it anymore before I now have before_action
			# get_category
			# tell the user they've updated
			flash[:success] = "Category updated"
			redirect_to root_path

		else
			# if category does not update stay in create form, but show errors 
			# advise the user there's been a validation error
			# we've already got the form we want to show (new.html.erb)

			# render "edit"
				# (method)
			render :edit 
				# (symbol - referes to the view)
				# works both ways above

			# edit is the form, update is the thing that updates it 
			# just like new and create work together
			# flash[:success] = "Category was not created, look at errors below"

		end
	end




	# actually delete the record of the category in the db
	def destroy
		# find it	
		# I don't need it anymore before I now have before_action
		# get_category

		# destroy that row
		@category.destroy

		# tell the user they've deleted
		flash[:success] = "Category deleted"

		#go back to index
		redirect_to root_path
	end	



	# letscreatea brand new method to simplify things
	# I can call it whatever
	def get_category
			@category = Category.find(params[:id]) 
	end

		#whitelist all of the form data
		#make sure we are secure from hackers
	def category_params
			params.require(:category).permit(:name, :rank)

	end 

end
