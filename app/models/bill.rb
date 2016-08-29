class Bill < ApplicationRecord
	validates :total_bill, presence: true
	validates :total_bill, numericality: true
	belongs_to :order
end
