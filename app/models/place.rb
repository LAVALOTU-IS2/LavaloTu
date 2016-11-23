class Place < ApplicationRecord
	geocoded_by :address
	after_validation :geocode
	validates :name, :address, presence: true
	validates :name, uniqueness: true
	has_one :user
	belongs_to :delivery
end
