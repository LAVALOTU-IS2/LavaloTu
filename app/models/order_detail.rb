class OrderDetail < ApplicationRecord
	validates :unit_cost, :cost, :quantity, presence: true
	belongs_to :order
	belongs_to :garment
end
