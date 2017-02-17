require 'rails_helper'

RSpec.feature "Characters" do
  before do
    @jackary = User.create!(email: "test@test.com", password: "123456")

    visit "/"
    click_link "Sign In"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  scenario "User creates a character" do
    visit "/"
    click_link "Characters"
    click_link "Add a character"

    fill_in "Name", with: "Jackary Smanch"
    fill_in "Race", with: "Business Dad"
    fill_in "Job", with: "Reluctant Hero"
    fill_in "Level", with: "1"

    fill_in "Strength", with: "18"
    fill_in "Constitution", with: "16"
    fill_in "Dexterity", with: "12"
    fill_in "Intelligence", with: "11"
    fill_in "Wisdom", with: "9"
    fill_in "Charisma", with: "8"

    fill_in "Armor class", with: "16"
    fill_in "Phys def", with: "16"
    fill_in "Mental def", with: "10"
    fill_in "Hit points", with: "30"
    fill_in "Recoveries", with: "9"
    fill_in "Recovery dice", with: "1d8+3"

    fill_in "One unique thing", with: "Once an average business dad, Jackary Smanch was cursed by a witch to become a powerful hero and also a deerfish"
    fill_in "Icons", with: "Witches -1, His Wife -2"
    fill_in "Backgrounds", with: "Business +4, Punching +3, Fatherhood +1"

    fill_in "Racial", with: "You have advantage on accounting skill checks"
    fill_in "Class features", with: "Regenerative Properties: Start with 1 extra recovery (9 total). Heroism: You must start with at least 1 point in a negative relationship with Witches"
    fill_in "Talents", with: "Insert first talent, insert second talent, insert third talent"

    fill_in "Melee atk", with: "+5 Attack, 1d8+4 Damage, 1 Miss"
    fill_in "Ranged atk", with: "+2 Attack, 1d6+1 Damage, 0 Miss"
    fill_in "Powers", with: "AWfesfaegmagmkaognaognaolnmaongaognmaokgnaononcvosnvoaneonfoaneofanefoaenofneonogeoagaogmnoagangaeongoangaongoarfssf Asthrdrtdduykudtfdkufufuryufujkfykufkfkuf"

    fill_in "Feats", with: "Name: Tier - Description, Name: Tier - Description"
    check "Improved initiative"
    fill_in "Equipment", with: "Punching gloves, suit, cape, pears"
    fill_in "Gold", with: "25"

    click_button "Create Character"

    expect(page).to have_content("Character was successfully created")
    expect(@jackary.characters.first.initiative).to eq(6)
    expect(page).not_to have_content("No characters added")
  end
end
