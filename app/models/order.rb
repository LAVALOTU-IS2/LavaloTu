class Order < ApplicationRecord
	validates :pickup_date, :total_cost, :status, presence: true
	#validates :score, numericality: true
	belongs_to :user
	belongs_to :laundry
	has_many :order_details, dependent: :destroy
	has_many :deliveries, dependent: :destroy
	has_many :garments, through: :order_details
	has_many :deliverers, through: :deliveries
end
