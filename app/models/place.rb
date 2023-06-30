class Place < ApplicationRecord
	geocoded_by :address
	validates :title, presence: true
	validates :street, presence: true
	validates :city, presence: true
	validates :state, presence: true
	validates :zip_code, presence: true
	after_validation :geocode, if: :address_changed?

	def address
		[street, city, state, zip_code].compact.join(', ')
	end

	def address_changed?
		street_changed? || city_changed? || state_changed? || zip_code_changed?
	end
end
