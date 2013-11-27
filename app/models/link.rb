class Link < ActiveRecord::Base
	# let's link up this model with the category
	# create the association with the line below 
	belongs_to :category

	# (we also have to link it in the other direction)

	# add some validations
	validates :name, presence: true
	validates :url, presence: true, uniqueness: true 

	# let's clean up the URLs to remove the http:// part and www when present
	def nice_url
		url.gsub("http://","").gsub("www.","")
	end

	# remove trailing slash
	# url.gsub</\/\z/>
	#             ^here finds the slash and the z tells it to end
end
