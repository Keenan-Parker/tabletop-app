require 'rails_helper'

RSpec.feature "Characters" do
  before do
    @cheenan = User.create!(email: "test@test.com", password: "123456")
  end

  scenario "User creates character" do
    visit "/"

  end
end
