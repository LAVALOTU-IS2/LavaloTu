class ServiceSerializer < ActiveModel::Serializer
  attributes :name, :cost
  has_one :garment
end
