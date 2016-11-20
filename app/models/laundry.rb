class Laundry < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name , :address, :opening_time, :closing_time, presence: true
	has_many :orders
	has_many :services, dependent: :destroy
	has_many :garments, through: :services
	has_many :deliverers, dependent: :destroy
end
