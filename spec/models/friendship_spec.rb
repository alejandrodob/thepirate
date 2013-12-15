require 'spec_helper'

describe Friendship do


  describe "validations: " do

    it "has a valid factory" do
      expect(create :friendship).to be_valid
    end

    it "has a user" do
      friendship = build(:friendship, user: nil)
      expect(friendship).not_to be_valid
    end

    it "has a friend" do
      friendship = build(:friendship, friend: nil)
      expect(friendship).not_to be_valid
    end

    it "is unique (a user is not friends with another more than once)" do
      user = build :user
      friend = build(:user, email: 'z@z.z')
      friendship1 = create(:friendship, user: user, friend: friend)
      friendship2 = build(:friendship, user: user, friend: friend)
      expect(friendship1).to be_valid
      expect(friendship2).not_to be_valid
    end

    it "cannot be between a user and himself" do
      user = create :user
      friendship = build(:friendship, user: user, friend: user)
      expect(friendship).not_to be_valid
    end

  end

  describe "utility methods" do

    describe "pending_request?" do

      it "returns true if the friendship represents a pending request" do
        user = build :user
        friend = build(:user, email: 'z@z.z')
        friendship = create(:friendship, user: user, friend: friend)
        expect(friendship.pending_request?).to be true
      end

      it "returns false if the request was accepted" do
        user = build :user
        friend = build(:user, email: 'z@z.z')
        request = create(:friendship, user: user, friend: friend)
        accept = create(:friendship, user: friend, friend: user)
        expect(request.pending_request?).to be false
      end

    end

  end

  describe "accepted?" do

    it "returns true if the a request was made and then accepted" do
        user = build :user
        friend = build(:user, email: 'z@z.z')
        request = create(:friendship, user: user, friend: friend)
        accept = create(:friendship, user: friend, friend: user)
        expect(request.accepted?).to be true
    end

    it "returns false if the request has not been accepted yet" do
      user = build :user
      friend = create(:user, email: 'z@z.z')
      request = create(:friendship, user: user, friend: friend)
      expect(request.accepted?).to be false
    end
  end

end
