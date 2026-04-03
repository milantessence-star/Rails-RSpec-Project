require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "Index Action" do
        it "GET /users" do
            user = User.create(name: "Milan", email: "abc@gmail.com", age: 23)
            get :index
            expect(assigns(:users)).to eq([ user ])
            expect(response).to have_http_status(200)
            expect(response).to render_template(:index)
        end
    end
    describe "Show Action" do
        it "GET /users/1" do
            user = User.create(name: "Milan", email: "abc@gmail.com", age: 23)
            get :show, params: { id: 1 }
            expect(assigns(:user)).to eq(user)
            expect(response).to have_http_status(200)
            expect(response).to render_template(:show)
        end
    end
    describe "New Action" do
        it "GET /users/new" do
            get :new
            expect(response).to have_http_status(200)
            expect(response).to render_template(:new)
        end
    end
    describe "Edit Action" do
        it "GET /users/1/edit" do
            user = User.create(name: "Milan", email: "abc@gmail.com", age: 23)
            get :edit, params: { id: 1 }
            expect(assigns(:user)).to eq(user)
            expect(response).to have_http_status(200)
            expect(response).to render_template(:edit)
        end
    end
    describe "Create Action" do
        it "POST /users" do
            user_params = { user: { name: "Milan", email: "abc@gmail.com", age: 23 } }
            expect {
                post :create, params: user_params
            }.to change(User, :count).by(1)
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(User.last)
        end
    end
    describe "Update Action" do
        it "PATCH /users" do
            user = User.create(name: "Milan", email: "abc@gmail.com", age: 23)
            patch :update, params: { id: user.id, user: { name: "Milan1", email: "abc@gmail.com", age: 23 } }
            user.reload
            expect(user.name).to eq("MILAN1")
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(User.last)
        end
    end
    describe "Delete Action" do
        it "DELETE /users/1" do
            user = User.create(name: "Milan", email: "abc@gmail.com", age: 23)
            expect {
                delete :destroy, params: { id: user.id }
        }.to change(User, :count).by(-1)
            expect(response).to have_http_status(302)
            expect(flash[:notice]).to include("Account deleted successfully.!")
            expect(response).to redirect_to(users_path)
        end
    end
end

puts "Hello world.!"