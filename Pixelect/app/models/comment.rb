# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :string
#  tournament_id :integer
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :tournament
end
