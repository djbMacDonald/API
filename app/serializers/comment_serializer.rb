class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :subcomment
end
