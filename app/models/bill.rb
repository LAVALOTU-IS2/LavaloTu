class Bill < ApplicationRecord
	validates :total_bill, presence: true
	validates :total_bill, numericality: true
	validates :total_bill, :numericality => {:greater_than_or_equal_to => 0} 
	belongs_to :order
end
