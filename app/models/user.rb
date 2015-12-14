class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

  has_many :messages, -> { order(created_at: :desc) }
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :friendships, class_name: 'Friendship', foreign_key: 'me_id', dependent: :destroy

  has_many :friends, through: :friendships, source: :friend

  def prospective_friends 
    User.all - self.friends - [self]
  end 
end
