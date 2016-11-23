class Place < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name , :address, presence: true
	belongs_to :user
	has_many :deliveries
end
