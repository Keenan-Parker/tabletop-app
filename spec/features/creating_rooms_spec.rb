require "rails_helper"

RSpec.feature "Rooms" do
  before do
    @keenan = User.create!(email: "test@test.com", password: "123456")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  scenario "User creates a room" do

    visit "/"
    click_link "Rooms"
    click_link "Create a room"
    fill_in "Room name", with: "Test Room"
    fill_in "Room password", with: "ABC123"
    fill_in "Your display name", with: "KeenanTheGM"
    click_button "Create Room"

    expect(page).to have_content("Room was successfully created")
    expect(page).not_to have_content("Create a room")
    expect(current_path).to eq(room_path(@keenan.rooms.first))
  end
end
