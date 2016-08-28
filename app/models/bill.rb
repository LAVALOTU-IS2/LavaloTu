class Bill < ApplicationRecord
	validates :total_bill, presence: true
	belongs_to :order
end
