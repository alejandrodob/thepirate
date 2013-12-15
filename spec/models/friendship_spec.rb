require 'spec_helper'

describe Friendship do

  describe "validations: " do

    it "has a valid factory" do
      expect(build :friendship).to be_valid
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
      user = create :user
      friend = create(:user, email: 'z@z.z')
      friendship1 = create(:friendship, user: user, friend: friend)
      friendship2 = build(:friendship, user: user, friend: friend)
      expect(friendship1)
      expect(friendship2).not_to be_valid
    end


  end

end
