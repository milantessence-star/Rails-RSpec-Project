require 'rails_helper'

RSpec.describe "User Management Flow", type: :system do
  before do
    driven_by :selenium, using: :firefox
  end

  it "creates and then destroys a user" do
    visit users_path
    click_link "New User"
    sleep 3

    expect(find("h1")).to have_content("New User")

    fill_in "Name", with: "Raj"
    fill_in "Email", with: "raj@gmail.com"
    # check "Active"

    click_button "Create User"
    sleep 3

    expect(page).to have_current_path(user_path(User.last))
    expect(page).to have_content("User was successfully created.")

    expect(page).to have_field("Name", with: "Raj", disabled: true)
    # expect(page).to have_css(".status-active")
    sleep 3

    visit users_path
    sleep 3

    within("#user_#{User.last.id}") do
      expect(page).to have_link("Destroy", href: user_path(User.last))

      accept_confirm do
        click_on "Destroy"
      end
    end

    sleep 3

    expect(page).to have_content("User was successfully destroyed.")
    expect(page).not_to have_text("Raj")
  end
end
