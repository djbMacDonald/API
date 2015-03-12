class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :question, :email_list
  has_many :comments
  has_many :images
end
