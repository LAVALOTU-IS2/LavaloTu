class LaundrySerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :score, :opening_time, :closing_time
  has_many :services
end

