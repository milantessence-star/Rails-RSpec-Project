require "rails_helper"

RSpec.describe "User Routing", type: :routing do
    describe "User routes" do
        it "GET /users" do
            expect(get: "/users").to route_to("users#index")
        end
        it "DELETE /users/:id" do
            expect(delete: "/users/1").to route_to(
                controller: "users",
                action: "destroy",
                id: "1"
            )
        end
        it "GET /users/1" do
            expect(get: user_path(1)).to route_to("users#show", id: "1")
        end
      # it "POST /users" do
      #     expect(post: users_path).not_to be_routable
      # end
    end
end
