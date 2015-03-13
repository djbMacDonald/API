class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :question, :email_list, :status, :popular
  has_many :comments
  has_many :images

  def status
    (Time.now - object.created_at) / 3600 < 24 ? 'open' : 'closed'
  end

  def popular
    object.images.sort{|a,b| a.wins <=> b.wins}[0]
  end
end
