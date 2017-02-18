require 'rails_helper'

RSpec.describe "rooms/edit", type: :view do
  before(:each) do
    @room = assign(:room, Room.create!(
      :name => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit room form" do
    render

    assert_select "form[action=?][method=?]", room_path(@room), "post" do

      assert_select "input#room_name[name=?]", "room[name]"

      assert_select "input#room_password[name=?]", "room[password]"
    end
  end
end
