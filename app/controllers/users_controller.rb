class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def dashboard 
		# @owner_restaurants = current_user.restaurants.all

		@owner_restaurants = Restaurant.where(user_id: current_user.id)
	end
end
