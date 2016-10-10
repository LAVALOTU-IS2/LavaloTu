class Laundry < ApplicationRecord
	has_many :services
	has_many :garments, through: :services
end
