require "rails_helper"

RSpec.describe "the lists index page" do
  before :each do
    @bad_list = List.create(title: "Bad List")
    @good_list = List.create(title: "Good List", archived: true)
  end

  it "displays a heading 'All Lists'" do
    visit "/"

    expect(page).to have_content("All Lists")
  end

  it "displays all unarchived lists" do
    visit "/"

    within("#list-title") do
      expect(page).to have_content(@bad_list.title)
    end

    within("#archive-status") do
      expect(page).to have_css("input[type='checkbox']")
    end
  end

  it "does not display archived lists" do
    visit "/"

    within("#list-title") do
      expect(page).to_not have_content(@good_list.title)
    end
  end
end
