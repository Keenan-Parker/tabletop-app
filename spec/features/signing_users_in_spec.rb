require 'rails_helper'

RSpec.feature "Sign in users" do
  before do
    @keenan = User.create!(email: 'test@test.com', password: "123456")
  end

  scenario "Sign user in with valid credentials" do
    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Sign Up")
  end
end
