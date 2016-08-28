class Service < ApplicationRecord
	validates :name, :cost, presence: true
	belongs_to :garment
end
