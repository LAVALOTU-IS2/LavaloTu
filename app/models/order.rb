class Order < ApplicationRecord
	validates :d_created, :d_finished, :state, presence: true
	validates :score, numericality: true
	has_one :bill
	belongs_to :user
	has_many :delivery
	has_many :garment
end
