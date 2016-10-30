class Restaurant < ApplicationRecord
	belongs_to :user
	validates :name, :address, :phone, :presence => true
end
