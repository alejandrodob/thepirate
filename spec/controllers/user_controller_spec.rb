require 'spec_helper'

describe UserController do

  before :each do
    @user = create :user
    sign_in @user
  end

  describe "GET 'home'" do

    it "returns http success" do
      get 'home'
      expect(response).to be_success
    end

    it "assigns the current user as @user" do
      get :home, {}
      expect(assigns(:user)).to eq(@user)
    end

    it "renders the user home page view" do
      get :home, {}
      expect(response).to render_template("home")
    end

  end

  describe "GET 'profile'" do
    xit "returns http success" do
      get 'profile'
      expect(response).to be_success
    end
  end

end

