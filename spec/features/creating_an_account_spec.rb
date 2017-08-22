require "rails_helper"

RSpec.feature "users can create an account" do
  before(:each) do
    visit root_path
    click_link "Login/Sign-up"
    click_link "Sign up"
  end

  scenario "with valid input" do
    fill_in "Email", with: Faker::Internet.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Logout"
    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "with invalid input" do
    fill_in "Email", with: ""
    fill_in "Password", with: ""
    fill_in "Password confirmation", with: ""
    click_on "Sign up"

    expect(page).to_not have_content "Logout"
  end
end
