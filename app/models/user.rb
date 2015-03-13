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
  has_secure_password
  has_many :tournaments
  # has_many :comments
  has_many :comments, through: :tournaments

  validates :name, :password, :email, presence: :true

  before_create :generate_token

  def generate_token
    return if token.present?
    begin
      self.token = SecureRandom.uuid.gsub(/\-/,'')
    end while self.class.exists?(token: token)
  end
end
