class AddRecommendedToLinks < ActiveRecord::Migration
  def change

  	# add a recommended col to table that is a boolean and defaults to false
  	add_column :links, :is_recommended, :boolean, default: false

  	# could be rename or remove cols here too
  end
end
