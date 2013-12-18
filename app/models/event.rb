class Event < ActiveRecord::Base
  belongs_to :user, inverse_of: :events
  has_many :participations
  has_many :participants, through: :participations, source: :user
  accepts_nested_attributes_for :participants

  def add_active_user_to_session(user)
    user_participation = participations.find_by(user_id: user, event_id: id)
    user_participation.status = 'online'
    user_participation.save
  end

  def remove_active_user_from_session(user)
    user_participation = participations.find_by(user_id: user, event_id: id)
    user_participation.status = 'offline'
    user_participation.save
  end

  def active_users
    participants.where(participations: { status: 'online' })
  end

  def active_users_to_json
    json = {active_users: []}
    active_users.each do |u|
      json[:active_users] << u.username
    end
    json
  end
end
