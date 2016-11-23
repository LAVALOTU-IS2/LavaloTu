class Deliverer < ApplicationRecord
  belongs_to :laundry 
  belongs_to :user 
  has_many :deliveries
end
