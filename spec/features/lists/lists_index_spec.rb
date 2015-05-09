require "rails_helper"

RSpec.describe "the lists index page" do
  before :each do
    List.create(title: "Bad List", archived: false)
    List.create(title: "Good List", archived: true)
  end

  it "displays a heading 'All Lists'" do
    visit "/"

    expect(page).to have_content("All Lists")
  end

  it "displays all unarchived lists" do
    visit "/"

    within("#list-title") do
      expect(page).to have_content("Bad List")
    end

    within("#archive-status") do
      expect(page).to have_css("input[type='checkbox']")
    end
  end

  it "does not display archived lists" do
    visit "/"

    within("#list-title") do
      expect(page).to_not have_content("Good List")
    end
  end

  it "has an option to create a new list" do
    visit "/"

    click_link_or_button("Create new list")

    expect(page).to have_content("New List")
  end
end
