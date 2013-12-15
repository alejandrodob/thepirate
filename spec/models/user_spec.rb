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

    it "when sending a request to another user, the relationship appears as pending" do
      requester = create :user
      requested = create :user, username: 'hu', email: 't@r.com'
      relation = requester.friendships.create(friend: requested)
      expect(requester.pending_requests).to eq([relation])
    end



  end

end
