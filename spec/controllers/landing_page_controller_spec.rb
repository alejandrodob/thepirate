require 'spec_helper'

describe LandingPageController do

  let(:valid_session) {}

  describe "GET #index"  do
    it "renders the landing page view" do
      get :index, {}, valid_session
      expect(response).to render_template("index")
    end
  end

end
