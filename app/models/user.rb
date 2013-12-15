class User < ActiveRecord::Base

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  validates_presence_of :username
  validates_uniqueness_of :username
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
