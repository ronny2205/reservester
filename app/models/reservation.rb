class Reservation < ApplicationRecord
	belongs_to :restaurant
	validates :email, :date, :time, :presence => true
end
