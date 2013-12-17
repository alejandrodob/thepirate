class Event < ActiveRecord::Base
  belongs_to :user, inverse_of: :events
  has_many :participations
  has_many :participants, through: :participations, source: :user
end
