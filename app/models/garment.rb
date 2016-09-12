class Garment < ApplicationRecord
	validates :name, presence: true
	#belongs_to :order
	has_one :order
	has_many :services, dependent: :destroy
end
