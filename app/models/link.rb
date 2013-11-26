class Link < ActiveRecord::Base
	# let's link up this model with the category
	# create the association with the line below 
	belongs_to :category

	# (we also have to link it in the other direction)

	# add some validations
	validates :name, presence: true
	validates :url, presence: true, uniqueness: true 

end
