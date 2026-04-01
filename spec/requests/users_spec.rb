require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user) { User.create(name: "Milan", email: "abc@gmail.com", age: 23) }

  describe "GET /users (index)" do
    it "renders a successful response" do
      get users_path
      expect(response).to have_http_status(200)
      expect(response.body).to include("Milan")
    end
  end

  describe "GET /users/:id (show)" do
    it "renders a successful response" do
      get user_path(user)
      expect(response).to have_http_status(200)
      expect(response.body).to include("Milan")
    end
  end

  describe "GET /users/new (new)" do
    it "renders a successful response" do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /users (create)" do
    context "with valid parameters" do
      let(:valid_params) { { user: { name: "New User", email: "new@gmail.com", age: 25 } } }

      it "creates a new User and redirects" do
        expect {
          post users_path, params: valid_params
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(user_path(User.last))
        follow_redirect!
        expect(response.body).to include("New User")
      end
    end
  end

  describe "PATCH /users/:id (update)" do
    it "updates the user and redirects" do
      patch user_path(user), params: { user: { name: "Milan1" } }
      user.reload
      expect(user.name).to eq("Milan1")
      expect(response).to redirect_to(user_path(user))
    end
  end

  describe "DELETE /users/:id (destroy)" do
    it "destroys the user and redirects" do
      expect {
        delete user_path(user)
      }.to change(User, :count).by(-1)

      expect(response).to redirect_to(users_path)
      expect(flash[:notice]).to include("Account deleted successfully.!")
    end
  end
end
