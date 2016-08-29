class Service < ApplicationRecord
	validates :name, :cost, presence: true
	validates :cost, numericality: true
	belongs_to :garment
end
