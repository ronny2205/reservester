class Restaurant < ApplicationRecord
	belongs_to :user
	has_many :reservations, dependent: :destroy 
	
	validates :name, :address, :phone, :presence => true
end
