class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_reservation, only: [:destroy]

	def create
		# @restaurant.resarvations.create(reservations_params.merge(:user => current_user))
		 
		@reservation = @restaurant.reservations.create(reservation_params)

		respond_to do |format|
	      if @reservation.save
	        format.html { redirect_to @restaurant, notice: 'Reservation was successfully created.' }
	        format.json { render :show, status: :created, location: @restaurant }
	      else
	        format.html { render :new }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
    	end

	end

	def destroy
      @reservation.destroy
	    respond_to do |format|
	      format.html { redirect_to @restaurant, notice: 'Reservatiom was successfully deleted.' }
	      format.json { head :no_content }
	    end
  end

private

	def set_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def set_reservation
		@reservation = Reservation.find(params[:id])
	end
	def reservation_params
    	params.require(:reservation).permit(:email, :date, :time, :message)
  	end	
end
