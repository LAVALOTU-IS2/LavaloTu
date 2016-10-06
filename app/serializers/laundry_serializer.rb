class LaundrySerializer < ActiveModel::Serializer
	attributes :id, :name

	has_many :garments, serializer: GarmentSerializer

end

