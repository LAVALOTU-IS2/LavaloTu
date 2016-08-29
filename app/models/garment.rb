class Garment < ApplicationRecord
	validates :name, :quantity, presence: true
	validates :quantity, numericality: true
	belongs_to :order
	has_many :service
end
