require "rails_helper"

RSpec.feature "users can edit articles" do
  let(:user1) { FactoryGirl.create(:user) }
  let(:user2) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:article) { FactoryGirl.create(:article, user: user1) }

  scenario "when admin" do
    login_as(admin)
    visit root_path

    click_link "#{article.title}"
    expect(page).to have_link "edit"
    expect(page).to have_link "delete"

    click_on "edit"

    fill_in "Language", with: "Ruby"
    click_on "Update Article"

    expect(page).to have_content "article updated"
  end

  scenario "when author of article" do
    login_as(user1)
    visit root_path

    click_link "#{article.title}"
    expect(page).to have_link "edit"
    expect(page).to_not have_link "delete"
  end

  scenario "when not authorised" do
    login_as(user2)
    visit root_path
    click_link "#{article.title}"

    expect(page).to_not have_link "edit"
    expect(page).to_not have_link "delete"
  end
end
