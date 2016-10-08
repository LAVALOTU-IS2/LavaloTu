class LaundrySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :score
  has_many :services
end

