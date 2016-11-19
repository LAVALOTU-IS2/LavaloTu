class Delivery < ApplicationRecord
	validates :direction, presence: true, numericality: true
	belongs_to :order
	belongs_to :deliverer
end
