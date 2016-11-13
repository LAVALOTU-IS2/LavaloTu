class Order < ApplicationRecord
	validates :status, presence: true
	#validates :score, numericality: true
	belongs_to :user
	belongs_to :laundry
	has_many :delivery
	has_many :order_details, dependent: :destroy
	has_many :garments, through: :order_details, dependent: :destroy
end
