class Garment < ApplicationRecord
	validates :name, presence: true
	#belongs_to :order
	has_many :services
	has_many :laundries, through: :services
end
