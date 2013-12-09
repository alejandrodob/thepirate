require 'spec_helper'

describe LandingPageController do

  describe "GET #index" do
    describe "with no user logged in" do
      it "renders the landing page view" do
        get :index, {}
        expect(response).to render_template("index")
      end
    end

    describe "with a user logged in" do
      it "redirects to user home page" do
        user = create :user
        sign_in user
        get :index, {}
        expect(response).to redirect_to(user)
      end
    end
  end

end
