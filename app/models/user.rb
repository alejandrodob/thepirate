class User < ActiveRecord::Base

  has_many :events

  has_many :friendships, foreign_key: 'user_id', dependent: :destroy
  has_many :requested_friends, through: :friendships, source: :friend
  has_many :reverse_friendships,
            foreign_key: 'friend_id',
            class_name: 'Friendship',
            dependent: :destroy
  has_many :requester_friends, through: :reverse_friendships, source: :user

  validates_presence_of :username
  validates_uniqueness_of :username
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def friends
    self.requester_friends & self.requested_friends
  end
end
