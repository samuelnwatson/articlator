require "rails_helper"

RSpec.feature "user can create articles" do
  before do
    visit root_path
  end

  context "when logged in" do
    scenario "when not authorised" do

    end

    scenario "when authorised" do

    end
  end

  context "when anonymous" do

  end
end
