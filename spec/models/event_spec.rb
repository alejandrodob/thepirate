require 'spec_helper'

describe Event do

  it "adds the user to active users" do
    creator = create :user
    event = create :event, user: creator
    participant = create :user, email: 'bla@bla.bla', username: 'participant'
    participation = create :participation, user: participant, event: event

    event.add_active_user_to_session(participant)

    expect(participant.participating_events).to eq([event])
    expect(event.active_users).to eq([participant])
  end

  it "removes the user from active users" do
    creator = create :user
    event = create :event, user: creator
    participant = create :user, email: 'bla@bla.bla', username: 'participant'
    participation = create :participation, user: participant, event: event

    event.add_active_user_to_session(participant)
    event.remove_active_user_from_session(participant)

    expect(event.active_users).to eq([])
  end

end
