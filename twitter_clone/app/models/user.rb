# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

class User < ApplicationRecord

  validates :email, :username, :password_digest, :session_token, presence: true 
  validates :email, :session_token, :username, uniqueness: true 
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :tweets,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: 'Tweet' 


  has_many :likes,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'Like'

  after_initialize :ensure_session_token 

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find(email: email)
    return nil unless user && user.valid_password?(password)
    user 
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end



end 
