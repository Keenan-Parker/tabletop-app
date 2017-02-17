require 'rails_helper'

RSpec.feature "Items" do
  before do
    @keenan = User.create!(email: "test@test.com", password: "123456")
    @jackary = @keenan.characters.create!(name: "Jackary", race: "Business Dad", job: "Reluctant Hero", level: "1", strength: "18", constitution: "16",
    dexterity: "12", intelligence: "11", wisdom: "9", charisma: "8", armor_class: "16", phys_def: "16", mental_def: "10", hit_points: "30", recoveries: "9",
    recovery_dice: "1d8+3", one_unique_thing: "Blahblahblahblahblh", icons: "icon1 +1, icon2 -2", backgrounds: "background1 +4 background2 +3 background3 +1",
    racial: "exampleracialablility", class_features: "exampleclassfeats", talents: "exampletalents", melee_atk: "examplemeleeatk", ranged_atk: "examplerangedatk",
    powers: "examplepower1, examplepower2, examplepower3, examplepower4", feats: "featone: stuff, feattwo: stuff", improved_initiative: "", equipment: "exampleitems",
    initiative: "2", gold: "25")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  scenario "User creates an item" do
    visit "/"
    click_link "Characters"
    click_link "View"
    click_link "Inventory"
    click_link "New item"

    fill_in "Name", with: "Axe"
    fill_in "Description", with: "A normal axe!"
    fill_in "Stats", with: "d8 damage"
    fill_in "Gold value", with: "5"
    fill_in "Character"
  end
end
