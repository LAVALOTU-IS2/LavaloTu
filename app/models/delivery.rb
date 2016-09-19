class Delivery < ApplicationRecord
	validates :name, presence: true
	validates :name, length: { maximum: 20 }
	validates :phone, presence: true
	validates :phone, numericality: true
	belongs_to :order
end
