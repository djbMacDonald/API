# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  password_digest :string
#  token           :string
#  email           :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
end
