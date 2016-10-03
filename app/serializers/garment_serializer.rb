class GarmentSerializer < ActiveModel::Serializer
  attributes :name

  has_many :services


  def services
    object.services.where(laundry_id: context[:id])
    #puts serialization_options[:id]
  end
end
