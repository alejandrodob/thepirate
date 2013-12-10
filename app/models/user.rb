class User < ActiveRecord::Base

  validates_presence_of :nickname
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
