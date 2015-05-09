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

    expect(page).to have_content(@bad_list.title)
    expect(page).to have_css("input[type='checkbox']")
  end

  it "does not display archived lists" do
    visit "/"

    expect(page).to_not have_content(@good_list.title)
  end

  it "allows user to see archived lists
  if they click the 'Archived Lists' link" do
    visit "/"
    click_link_or_button("Archived Lists")

    expect(page).to have_content(@good_list.title)
    expect(page).to_not have_content(@bad_list.title)
  end

  it "allows user to navigate back and forth
  between archived and unarchived lists" do
    visit "/"
    click_link_or_button("Archived Lists")
    click_link_or_button("Unarchived Lists")

    expect(page).to have_content(@bad_list.title)
    expect(page).to_not have_content(@good_list.title)
  end
end
