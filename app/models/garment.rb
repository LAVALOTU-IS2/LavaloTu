class Garment < ApplicationRecord
	validates :name, :quantity, presence: true
	belongs_to :order
	has_many :service
end
