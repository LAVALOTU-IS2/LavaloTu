class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :lastname, :email, :phone, :role, :auth_token
end
