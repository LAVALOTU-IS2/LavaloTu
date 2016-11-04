class Garment < ApplicationRecord
	validates :name, presence: true
	#belongs_to :order
	has_many :services, dependent: :destroy
	has_many :laundries, through: :services, dependent: :destroy
end
