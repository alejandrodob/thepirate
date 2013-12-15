require 'spec_helper'

describe User do

  describe "validates" do

    it "has a valid factory" do
      expect(create(:user)).to be_valid
    end

    it "presence of a username" do
      user = build(:user, username: nil)
      expect(user).not_to be_valid
    end
  end
end
