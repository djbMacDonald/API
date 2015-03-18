class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :question, :email_list, :status, :popular, :comments, :images

  def status
    (Time.now - object.created_at) / 3600 < 24 ? 'open' : 'closed'
  end

  def popular
    object.images.sort{|a,b| a.wins <=> b.wins}[-1]
  end

  def images
    object.images.map { |image|
      image.flags < 3 ? image : nil
    }.compact
  end
end
