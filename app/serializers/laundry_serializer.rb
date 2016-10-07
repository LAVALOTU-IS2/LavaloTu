class LaundrySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :score
end

