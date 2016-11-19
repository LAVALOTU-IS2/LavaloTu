class Deliverer < ApplicationRecord
  belongs_to :laundry
  has_many :deliveries
end
