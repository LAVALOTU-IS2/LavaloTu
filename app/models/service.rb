class Service < ApplicationRecord
	validates :name, :cost, presence: true
	validates :cost, numericality: true
	belongs_to :garment
	belongs_to :laundry

	def validate_id?(id)
		self.laundry_id != id
	end
end
