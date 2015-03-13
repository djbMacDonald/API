class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :tournaments
  has_many :comments
end
