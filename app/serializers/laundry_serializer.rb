class LaundrySerializer < ActiveModel::Serializer
	attributes :id, :name

	has_many :garments, serializer: GarmentSerializer, context: {id: 1}

end

