require 'rails_helper'

RSpec.feature "Sign up users" do
  scenario "Sign user up with valid credentials" do
    visit "/"
    click_link "Sign Up"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Sign Up")
  end
end
