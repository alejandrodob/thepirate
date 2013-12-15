class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"

  validates_presence_of :user
  validates_presence_of :friend
  validate :unique?, on: :create
  validate :self_friendship?, on: :create

  def pending_request?
    Friendship.where(user_id: friend, friend_id: user).count == 0
  end

  def accepted?
    Friendship.where(user_id: friend, friend_id: user).count == 1
  end


  private

  def unique?
    if Friendship.where(user_id: user, friend_id: friend).count > 0
      errors.add(:friendship, "this friendship already exists")
    end
  end

  def self_friendship?
    if user == friend
      errors.add(:friendship, "cannot be friend of himself")
    end
  end
end
