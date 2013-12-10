require 'spec_helper'

describe User do

  describe "validates" do

    it "presence of a nickname" do
      user = build(:user, nickname: nil)
      expect(user).not_to be_valid
    end
  end
end
