require 'spec_helper'

describe User do

  describe "validates" do

    it "has a valid factory" do
      expect(create(:user)).to be_valid
    end

    it "has a username" do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end

    it "username is unique" do
      user = create(:user, username: 'mindy', email:'w@w.w')
      user2 = build(:user, username: 'mindy')
      expect(user2).not_to be_valid
    end

  end

  describe "friends, friendships and requests for friendship" do

    it "when sending a request to another user, it appears as requested" do
      requester = create :user
      requested = create :user, username: 'hu', email: 't@r.com'
      requester.friendships.create(friend: requested)
      expect(requester.requested_friends).to eq([requested])
    end

    it "when being requested as friend by another user, it appears as requester" do
      requester = create :user
      requested = create :user, username: 'hu', email: 't@r.com'
      requester.friendships.create(friend: requested)
      expect(requested.requester_friends).to eq([requester])
    end

    it "has someone as friend if and only if is a requested and requester friend" do
      friend1 = create :user
      friend2 = create :user, username: 'hu', email: 't@r.com'
      friend3 = create :user, username: 'yen', email: 'r@r.com'
      friend1.friendships.create(friend: friend2)
      friend2.friendships.create(friend: friend1)
      friend3.friendships.create(friend: friend2)
      expect(friend1.friends).to eq([friend2])
      expect(friend2.friends).to eq([friend1])
      expect(friend3.friends).to eq([])
    end

  end

end
