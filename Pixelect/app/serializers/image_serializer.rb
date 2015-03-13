class ImageSerializer < ActiveModel::Serializer
  attributes :id, :url, :wins, :flags
end
