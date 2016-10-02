class ServiceSerializer < ActiveModel::Serializer
  attributes :name, :cost

  belongs_to :garment
  belongs_to :laundry
end
	