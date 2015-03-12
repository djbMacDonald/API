# == Schema Information
#
# Table name: images
#
#  id            :integer          not null, primary key
#  tournament_id :integer
#  url           :string
#  wins          :integer
#  flags         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Image < ActiveRecord::Base
  belongs_to :tournament
  validates :url, :tournament_id, presence: true
end
