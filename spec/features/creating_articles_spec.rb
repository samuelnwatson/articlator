require "rails_helper"

RSpec.feature "users can create articles" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "when anonymous" do
    visit root_path
    expect(page).to_not have_content 'new article'
  end

  scenario "when logged in" do
    login_as(user)
    visit root_path

    expect(page).to have_content 'new article'
    click_link 'new article'

    fill_in "Title", with: Faker::TheFreshPrinceOfBelAir.character
    fill_in "Content", with: Faker::TheFreshPrinceOfBelAir.quote
    fill_in "Language", with: 'python'
    click_on "Create Article"

    expect(page).to have_content 'article created'
  end
end
