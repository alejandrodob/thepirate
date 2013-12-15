require 'spec_helper'

describe FriendshipsController do

  let(:valid_session) {}
  before :each do
    @friend = create :user, username: 'albert', email: 'as@es.as'
    @user = create :user
    sign_in @user
    @friendship = @user.friendships.create(friend: @friend)
  end

  describe "GET #index" do

    it "assigns only the current user friendships as @friendships" do
      another_friendship = create :friendship
      get :index, {}
      expect(assigns(:friendships)).to eq([@friendship])
    end

    it "doesn't assign any friendships to @friendships if no user is logged in" do
      sign_out @user
      expect(assigns(:friendships)).to be nil
    end

  end

  describe "GET #new" do

    it "assigns @friendship to a new empty friendship" do
      get :new, {}
      expect(assigns(:friendship)).to be_a_new(Friendship)
      expect(assigns(:friendships)).to be nil
    end

  end

  describe "GET #show" do

    it "assings the requested friendship as @friendship" do
      get :show, { id: @friendship.to_param }, valid_session
      expect(assigns(:friendship)).to eq(@friendship)
    end

  end

  describe "GET #edit" do

    xit "assigns the requested friendship as @friendship" do
      get :edit, { id:friendship.to_param }, valid_session
      expect(assigns(:friendship)).to eq(friendship)
    end

    xit "renders edit view" do
      get :edit, { id:friendship.to_param }, valid_session
      expect(response).to render_template("edit")
    end

  end

  describe "POST #create" do

    describe "wxith valid attributes" do

      xit "creates a new friendship" do
        expect {
        post :create, { friendship: attributes_for(:friendship) }, valid_session
        }.to change(Address, :count).by(1)
      end

      xit "saves newly created friendship and assings as @friendship" do
        post :create, { friendship: attributes_for(:friendship) }, valid_session
        expect(assigns(:friendship)).to be_a(Address)
        expect(assigns(:friendship)).to be_persisted
      end

      xit "redirects to new friendship" do
        post :create, { friendship: attributes_for(:friendship) }, valid_session
        expect(response).to redirect_to(Address.last)
      end

    end

    describe "wxith invalid attributes" do

      xit "should not create a new friendship" do
        expect {
        post :create, { friendship: { :street => nil } }, valid_session
        }.not_to change(Address, :count)
      end

      xit "should render the new friendship template" do
        post :create, { friendship: { :street => nil } }, valid_session
        expect(response).to render_template("new")
      end

    end

  end

  describe "PUT #update" do

    describe "wxith valid attributes" do

      xit "locates the requested friendship" do
        put :update,
            { id: friendship.to_param, friendship: attributes_for(:friendship) },
            valid_session
        expect(assigns(:friendship)).to eq(friendship)
      end

      xit "updates the attributes" do
        put :update,
            { id: friendship.to_param, friendship: attributes_for(:friendship, street: "Cavanilles") },
            valid_session
        expect(assigns(:friendship).street).to eq("Cavanilles")
      end

      xit "redirects to the updated friendship" do
        put :update,
            { id: friendship.to_param, friendship: attributes_for(:friendship) },
            valid_session
        expect(response).to redirect_to(friendship)
      end

    end

    describe "wxith invalid attributes" do

      xit "locates the requested friendship" do
        put :update,
            { id: friendship.to_param, friendship: { street: nil } },
            valid_session
        expect(assigns(:friendship)).to eq(friendship)
      end

      xit "does not change any attributes" do
        put :update,
            { id: friendship.to_param, friendship: { street: nil, number: 33 } },
            valid_session
        expect(assigns(:friendship).reload.street).not_to be nil
        expect(assigns(:friendship).reload.number).not_to eq 33
      end

      xit "re-renders the edxit template" do
        put :update,
            { id: friendship.to_param, friendship: { street: nil, number: 33 } },
            valid_session
        expect(response).to render_template("edxit")
      end

    end

  end

  describe "DELETE #destroy" do

    xit "locates the requested friendship" do
      delete :destroy, { id: friendship.to_param }, valid_session
      expect(assigns(:friendship)).to eq(friendship)
    end

    xit "deletes the requested friendship" do
      friendship
      expect {
        delete :destroy, { id: friendship.to_param }, valid_session
        }.to change(Address, :count).by(-1)
    end

    xit "redirects to the friendship index" do
      delete :destroy, { id: friendship.to_param }, valid_session
      expect(response).to redirect_to(friendships_url)
    end

  end

end
