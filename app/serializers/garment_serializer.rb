class GarmentSerializer < ActiveModel::Serializer
  attributes :name

  has_many :laundries, through: :services
  has_many :services
end
