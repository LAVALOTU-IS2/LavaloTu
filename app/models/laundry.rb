class Laundry < ApplicationRecord
	has_many :services, dependent: :destroy
	has_many :garments, through: :services, dependent: :destroy
end
