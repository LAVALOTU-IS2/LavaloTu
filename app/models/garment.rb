class Garment < ApplicationRecord
	validates :name, presence: true
	has_many :services, dependent: :destroy
	has_many :laundries, through: :services
	has_many :order_details
end
