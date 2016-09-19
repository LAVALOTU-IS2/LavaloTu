class GarmentSerializer < ActiveModel::Serializer
  attributes :name

  has_many :services
end
