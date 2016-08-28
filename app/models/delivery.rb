class Delivery < ApplicationRecord
	validates :name, :phone, presence: true
	belongs_to :order
end
