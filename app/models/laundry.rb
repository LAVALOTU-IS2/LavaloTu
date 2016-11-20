class Laundry < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name , :address, presence: true
	has_many :orders
	has_many :services, dependent: :destroy
	has_many :garments, through: :services
end
