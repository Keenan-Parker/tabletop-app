require 'rails_helper'

RSpec.feature "Items" do
  before do
    @jackary = User.create!(email: "test@test.com", password: "123456")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  scenario "User creates an item" do
    visit "/"
  end
end
