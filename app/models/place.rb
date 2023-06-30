class Place < ApplicationRecord
	validates :title, presence: true, uniqueness: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true

	def address
		[street, city, state, zip_code].compact.join(', ')
	end
end
