class LaundrySerializer < ActiveModel::Serializer
  attributes :name

  has_many :services
  has_many :garments, through: :services
end

