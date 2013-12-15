class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"

  validates_presence_of :user
  validates_presence_of :friend
  validate :unique?


  private

  def unique?
    if Friendship.where(user_id: user, friend_id: friend).count > 0
      errors.add(:friendship, "this friendship already exists")
    end
  end
end
