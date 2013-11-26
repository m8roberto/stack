class Category < ActiveRecord::Base

	# let's link up this model with the links
	# create the association with the line below 
	has_many :links

	# rails is very good at pluralisation (eg: "links" instead of "link" above)

	# let's add some validations to 
	# make sure the data is what we want it to be

	validates :name, presence: true, uniqueness: {message: "already used", case_sensitive: false}
	validates :rank, presence: true, numericality: {greater_than: 0}, length: { maximum: 2 }




end
