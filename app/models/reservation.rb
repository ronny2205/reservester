class Reservation < ApplicationRecord
	belongs_to :restaurant
	validates :email, :date, :time, :presence => true
	after_create :send_reservation_email

	def send_reservation_email
      ReservationMailer.reservation_notification(self).deliver
  end
end
