require 'rails_helper'

RSpec.describe "users/index", type: :view do
  describe "Index page validation" do
    users = [
            User.create(name: "Milankumar Jaysukhbhai Thesiya", email: "milan@gmail.com", age: 23),
            User.create(name: "Milankumarr Jaysukhbhai Thesiya", email: "milan@gmail.com", age: 23)
          ]
    it "assign data to view" do
      assign(:users, users)
      render
      # render partial: "users/user"
      expect(rendered).to have_selector("h1", text: "Milankumar")
      expect(rendered).to have_selector("h1", text: "Milankumarr")
      users.each do |user|
        expect(rendered).to have_link("Edit", href: edit_user_path(user))
      end
      users.each do |user|
        expect(rendered).to have_field("Name")
      end
      expect(rendered).to have_button("Save")
      # expect(view).to render_template(partial: "_user")
    end
  end
end
